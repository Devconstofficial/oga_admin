import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oga_admin/models/report_model.dart';
import 'package:oga_admin/services/report_service.dart';
import 'package:oga_admin/utils/custom_snackbar.dart';

class UserReportsController extends GetxController {
  final ReportService _service = ReportService();
  var selectedReportStatus = ''.obs;

  var selectedStatuses = <String>{}.obs;
  var isUpdating = false.obs;
  var isLoading = false.obs;
  var isDeleting = false.obs;
  var isBlocking = false.obs;

  final RxList<ReportModel> allReports = <ReportModel>[].obs;
  final RxList<ReportModel> filteredReports = <ReportModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getReports();
  }

  void getReports() async {
    try {
      isLoading(true);
      var result = await _service.getReports();
      if (result is List<ReportModel>) {
        isLoading(false);
        allReports.value = result;
        filteredReports.value = result;
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
      var result = await _service.deleteReport(id: id);
      if (result is bool) {
        isDeleting(false);
        Get.back();
        getReports();
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

  void blockPost({required String id}) async {
    try {
      isBlocking(true);
      var result = await _service.blockPost(id: id);
      if (result is bool) {
        isBlocking(false);
        Get.back();
        showCustomSnackbar(
          "Success",
          "Blocked successfully",
          backgroundColor: Colors.green,
        );
        return;
      } else {
        isBlocking(false);
        showCustomSnackbar(
          "Error",
          result.toString(),
        );
      }
    } catch (e) {
      isBlocking(false);
      showCustomSnackbar(
        "Error",
        e.toString(),
      );
    }
  }

  void updateUser({required String id}) async {
    try {
      isUpdating(true);
      var result = await _service.updateReport(body: {
        "status":
            selectedReportStatus.value == "Pending" ? "pending" : "resolved"
      }, id: id);
      if (result is bool) {
        isUpdating(false);
        Get.back();
        getReports();
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

  final int itemsPerPage = 4;

  final RxInt currentPage = 1.obs;

  List<ReportModel> get currentPageUsers {
    final startIndex = (currentPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return filteredReports.sublist(
      startIndex,
      endIndex > filteredReports.length ? filteredReports.length : endIndex,
    );
  }

  int get totalPages => (filteredReports.length / itemsPerPage).ceil();

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

  void filterReportsByStatuses() {
    if (selectedStatuses.isNotEmpty) {
      filteredReports.value = allReports
          .where((report) =>
              selectedStatuses.contains(report.status.toLowerCase()))
          .toList();
    } else {
      filteredReports.value = allReports;
    }

    currentPage.value = 1;
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
