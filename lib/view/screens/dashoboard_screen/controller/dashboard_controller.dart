import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oga_admin/models/user_model.dart';
import 'package:oga_admin/services/user_service.dart';
import 'package:oga_admin/utils/custom_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oga_admin/utils/session_management/session_management.dart';
import 'package:oga_admin/utils/session_management/session_token_keys.dart';

class DashboardController extends GetxController {
  final UserService _service = UserService();
  final SessionManagement _sessionManagement = SessionManagement();
  var selectedUserStatus = ''.obs;
  var selectedStatuses = <String>{}.obs;
  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  var isLoading = false.obs;
  var isDeleting = false.obs;
  var isUpdating = false.obs;
  var totalUsers = 0.obs;
  RxList<UserModel> filteredUsers = <UserModel>[].obs;
  RxList<UserModel> allUsers = <UserModel>[].obs;
  Rx<UserModel?> user = Rx<UserModel?>(null);

  final int itemsPerPage = 4;

  final RxInt currentPage = 1.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = await image.readAsBytes();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsers();
    getUserData();
  }

  Future<void> getUserData() async {
    String userJson = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserModelKey,
    );

    if (userJson.isNotEmpty) {
      user.value = UserModel.fromJson(jsonDecode(userJson));
    } else {
      user.value = null;
    }
  }

  void getUsers() async {
    try {
      isLoading(true);
      var result = await _service.getUsers();
      if (result is List<UserModel>) {
        isLoading(false);
        allUsers.value = result;
        totalUsers.value = allUsers.length;
        filteredUsers.value = result;
        return;
      } else {
        isLoading(false);
        showCustomSnackbar(
          "Error",
          result.toString(),
        );
      }
    } catch (e) {
      isLoading(false);
      showCustomSnackbar(
        "Error",
        e.toString(),
      );
    }
  }

  void deleteUser({required String id}) async {
    try {
      isDeleting(true);
      var result = await _service.deleteUser(id: id);
      if (result is bool) {
        isDeleting(false);
        Get.back();
        getUsers();
        showCustomSnackbar(
          "Success",
          "Deleted successfully",
          backgroundColor: Colors.green,
        );
        return;
      } else {
        isDeleting(false);
        showCustomSnackbar(
          "Error",
          result.toString(),
        );
      }
    } catch (e) {
      isDeleting(false);
      showCustomSnackbar(
        "Error",
        e.toString(),
      );
    }
  }

  void updateUser({required String id}) async {
    try {
      isUpdating(true);
      var result = await _service.updateUser(body: {
        "status": selectedUserStatus.value == "Active" ? "active" : "banned"
      }, id: id);
      if (result is bool) {
        isUpdating(false);
        Get.back();
        getUsers();
        showCustomSnackbar(
          "Success",
          "Updated successfully",
          backgroundColor: Colors.green,
        );
        return;
      } else {
        isUpdating(false);
        showCustomSnackbar(
          "Error",
          result.toString(),
        );
      }
    } catch (e) {
      isUpdating(false);
      showCustomSnackbar(
        "Error",
        e.toString(),
      );
    }
  }

  List<UserModel> get currentPageUsers {
    final startIndex = (currentPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return filteredUsers.sublist(
      startIndex,
      endIndex > filteredUsers.length ? filteredUsers.length : endIndex,
    );
  }

  int get totalPages => (filteredUsers.length / itemsPerPage).ceil();

  void changePage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalPages) {
      currentPage.value = pageNumber;
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 1) {
      currentPage.value -= 1;
    }
  }

  // Next button functionality
  void goToNextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value += 1;
    }
  }

  void filterUsersByStatuses() {
    if (selectedStatuses.isNotEmpty) {
      filteredUsers.value = allUsers
          .where((user) => selectedStatuses.contains(user.status.toLowerCase()))
          .toList();
    } else {
      filteredUsers.value = allUsers;
    }

    currentPage.value = 1;
  }

  // Check if back button should be disabled
  bool get isBackButtonDisabled => currentPage.value == 1;

  // Check if next button should be disabled
  bool get isNextButtonDisabled => currentPage.value == totalPages;
}
