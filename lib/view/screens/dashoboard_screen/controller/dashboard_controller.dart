import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

class DashboardController extends GetxController {
  var selectedUserType = ''.obs;
  var selectedPayType = ''.obs;
  var selectedReminderType = ''.obs;
  var selectedFilters = <String>{}.obs;
  var isNotificationVisible = false.obs;
  var selectedUserStatus = ''.obs;
  var selectedLocation = ''.obs;
  var isFreeDelivery = false.obs;
  var isPayCash = false.obs;


  final List<Map<String, dynamic>> allUsers = [
    {"id": "00001", "name": "Christine Brooks", "location": "New York", "profileStatus": "Public", "accountStatus": "Blocked", "statusBackColor": kRedColor, "StatusColor": kRedColor.withOpacity(0.2)},
    {"id": "00001", "name": "Rosie Pearson", "location": "London", "profileStatus": "Private", "accountStatus": "Active", "statusBackColor": kGreenColor, "StatusColor": kGreenColor.withOpacity(0.2)},
    {"id": "00001", "name": "Rosie Pearson", "location": "Beijing", "profileStatus": "Public", "accountStatus": "Active", "statusBackColor": kGreenColor, "StatusColor": kGreenColor.withOpacity(0.2)},
    {"id": "00001", "name": "Christine Brooks", "location": "Iceland", "profileStatus": "Private", "accountStatus": "Active", "statusBackColor": kGreenColor, "StatusColor": kGreenColor.withOpacity(0.2)},
    {"id": "00001", "name": "Rosie Pearson", "location": "Iceland", "profileStatus": "Public", "accountStatus": "Active", "statusBackColor": kGreenColor, "StatusColor": kGreenColor.withOpacity(0.2)},
    {"id": "00001", "name": "Rosie Pearson", "location": "Beijing", "profileStatus": "Private", "accountStatus": "Active", "statusBackColor": kGreenColor, "StatusColor": kGreenColor.withOpacity(0.2)},
    {"id": "00001", "name": "Christine Brooks", "location": "New York", "profileStatus": "Public", "accountStatus": "Blocked", "statusBackColor": kRedColor, "StatusColor": kRedColor.withOpacity(0.2)},
    {"id": "00001", "name": "Rosie Pearson", "location": "London", "profileStatus": "Private", "accountStatus": "Blocked", "statusBackColor": kRedColor, "StatusColor": kRedColor.withOpacity(0.2)},
    {"id": "00001", "name": "Rosie Pearson", "location": "London", "profileStatus": "Private", "accountStatus": "Blocked", "statusBackColor": kRedColor, "StatusColor": kRedColor.withOpacity(0.2)},
    {"id": "00001", "name": "Rosie Pearson", "location": "London", "profileStatus": "Private", "accountStatus": "Blocked", "statusBackColor": kRedColor, "StatusColor": kRedColor.withOpacity(0.2)},
    {"id": "00001", "name": "Rosie Pearson", "location": "London", "profileStatus": "Private", "accountStatus": "Blocked", "statusBackColor": kRedColor, "StatusColor": kRedColor.withOpacity(0.2)},

  ];

  final int itemsPerPage = 4;

  final RxInt currentPage = 1.obs;

  List<Map<String, dynamic>> get currentPageUsers {
    final startIndex = (currentPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return allUsers.sublist(
      startIndex,
      endIndex > allUsers.length ? allUsers.length : endIndex,
    );
  }

  int get totalPages => (allUsers.length / itemsPerPage).ceil();

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


  // Check if back button should be disabled
  bool get isBackButtonDisabled => currentPage.value == 1;


  // Check if next button should be disabled
  bool get isNextButtonDisabled => currentPage.value == totalPages;

}