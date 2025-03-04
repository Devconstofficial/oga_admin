import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:oga_admin/models/report_model.dart';
import 'package:oga_admin/view/widgets/delete_dialog.dart';
import 'package:oga_admin/view/widgets/profile_dialog.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/post_detail_dialog.dart';
import 'controller/user_report_controller.dart';

class UserReportsScreen extends GetView<UserReportsController> {
  const UserReportsScreen({super.key});

  Widget statusUpdateDialogue(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: kBackColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.customBorder8,
      ),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: AppStyles().paddingAll24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      kCrossIcon,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Report Status",
                style: AppStyles.workSansTextStyle()
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    color: kBackColor,
                    borderRadius: AppStyles.customBorder8,
                    border: Border.all(color: kGray3Color)),
                child: Obx(() {
                  return DropdownButton<String>(
                    borderRadius: AppStyles.customBorder8,
                    isExpanded: true,
                    dropdownColor: kBackColor,
                    focusColor: kBackColor,
                    value: controller.selectedReportStatus.value.isNotEmpty
                        ? controller.selectedReportStatus.value
                        : null,
                    hint: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Report Status",
                        style: AppStyles.workSansTextStyle()
                            .copyWith(fontSize: 14, color: kSecondaryColor),
                      ),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(top: 5, right: 5),
                      child: Icon(Icons.keyboard_arrow_down_outlined,
                          size: 20, color: kGray4Color),
                    ),
                    underline: const SizedBox.shrink(),
                    items: ["Pending", "Resolved"]
                        .map((String status) => DropdownMenuItem<String>(
                              value: status,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  status,
                                  style: AppStyles.workSansTextStyle()
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      controller.selectedReportStatus.value = newValue!;
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: "Cancel",
                    height: 40,
                    onTap: () {
                      Get.back();
                    },
                    width: 75,
                    textColor: kBlackColor,
                    color: kBackColor,
                    borderColor: kGray3Color,
                    fontSize: 14,
                  ),
                  CustomButton(
                    text: "Update Status",
                    height: 40,
                    onTap: () {
                      Get.back();
                    },
                    width: 120,
                    fontSize: 14,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(onTap: () {
      CommonCode.unFocus(context);
    }, child: Obx(
      () {
        return Scaffold(
          backgroundColor: kBackColor,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SideMenu(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: kButtonColor,
                        height: 80,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 32.w),
                          child: Row(
                            children: [
                              Text(
                                kUserReports,
                                style: AppStyles.workSansTextStyle().copyWith(
                                    fontSize: 26.sp,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: AppStyles.customBorder8,
                                    color: kWhiteColor.withOpacity(0.12)),
                                child: Center(
                                    child: SvgPicture.asset(
                                  kNotiIcon,
                                  height: 14,
                                  width: 14,
                                )),
                              ),
                              SizedBox(
                                width: 26.w,
                              ),
                              Obx(() => SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: ClipRRect(
                                      borderRadius: AppStyles.customBorder16,
                                      child: controller.user.value == null
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                color: kWhiteColor,
                                              ),
                                            )
                                          : controller.user.value!
                                                  .profilePicture.isEmpty
                                              ? Image.asset(kUserImage)
                                              : ImageNetwork(
                                                  image: controller.user.value!
                                                      .profilePicture,
                                                  width: 60,
                                                  height: 60,
                                                  duration: 1500,
                                                  curve: Curves.easeIn,
                                                  onPointer: true,
                                                  debugPrint: false,
                                                  fitAndroidIos: BoxFit.cover,
                                                  fitWeb: BoxFitWeb.cover,
                                                  onError: Icon(
                                                      Icons.broken_image,
                                                      size: 40.sp,
                                                      color: kWhiteColor),
                                                  onLoading:
                                                      const CircularProgressIndicator(
                                                    color: kWhiteColor,
                                                  ),
                                                  imageCache:
                                                      AssetImage(kUser1Image),
                                                ),
                                    ),
                                  )),
                              SizedBox(
                                width: 18.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() => Text(
                                        controller.user.value == null
                                            ? ""
                                            : controller.user.value!.name,
                                        style: AppStyles.workSansTextStyle()
                                            .copyWith(
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                                fontWeight: FontWeight.w500),
                                      )),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    "Admin",
                                    style: AppStyles.workSansTextStyle()
                                        .copyWith(
                                            fontSize: 12.sp,
                                            color: kWhiteColor,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ProfileDialog();
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0.w),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: kWhiteColor,
                                      size: 16,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: AppStyles().horizontal32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 32.h,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kWhiteColor,
                                      border: Border.all(
                                          color: kTableBorderColor,
                                          width: 0.6)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.w),
                                        child: SvgPicture.asset(
                                          kFilterIcon,
                                          height: 23,
                                          width: 20,
                                          colorFilter: const ColorFilter.mode(
                                              kBlackColor, BlendMode.srcIn),
                                        ),
                                      ),
                                      Container(
                                        width: 0.3,
                                        color: kLightGreyColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.w),
                                        child: Text(
                                          kFilterBy,
                                          style: AppStyles.workSansTextStyle()
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        width: 0.3,
                                        color: kLightGreyColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.w),
                                        child: Text(
                                          "Report Status",
                                          style: AppStyles.workSansTextStyle()
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: kBlackColor1),
                                        ),
                                      ),
                                      PopupMenuButton<String>(
                                        color: kWhiteColor,
                                        position: PopupMenuPosition.under,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                AppStyles.customBorder8,
                                            borderSide: BorderSide.none),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            size: 16),
                                        onSelected: (value) {},
                                        itemBuilder: (BuildContext context) {
                                          return [kPending, "Resolved"]
                                              .map((status) {
                                            return PopupMenuItem<String>(
                                              value: status,
                                              child: Row(
                                                children: [
                                                  Obx(() => Checkbox(
                                                        activeColor:
                                                            kButtonColor,
                                                        value: controller
                                                            .selectedStatuses
                                                            .contains(status
                                                                .toLowerCase()),
                                                        onChanged:
                                                            (bool? isChecked) {
                                                          if (controller
                                                              .selectedStatuses
                                                              .contains(status
                                                                  .toLowerCase())) {
                                                            controller
                                                                .selectedStatuses
                                                                .remove(status
                                                                    .toLowerCase());
                                                          } else {
                                                            controller
                                                                .selectedStatuses
                                                                .add(status
                                                                    .toLowerCase());
                                                          }
                                                          controller
                                                              .filterReportsByStatuses();
                                                        },
                                                      )),
                                                  Text(
                                                    status,
                                                    style: AppStyles
                                                            .interTextStyle()
                                                        .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Text(
                              "Reports",
                              style: AppStyles.workSansTextStyle().copyWith(
                                  fontSize: 20.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Obx(() => controller.isLoading.value
                                ? SizedBox(
                                    height: 200.w,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: kDarkGrey,
                                      ),
                                    ),
                                  )
                                : controller.filteredReports.isEmpty
                                    ? SizedBox(
                                        height: 200.w,
                                        child: Center(
                                          child: Text(
                                            "No reports found",
                                            style: AppStyles.workSansTextStyle()
                                                .copyWith(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14.r),
                                          border: Border.all(
                                              color: kTableBorderColor,
                                              width: 0.3),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 49,
                                              decoration: BoxDecoration(
                                                color: kButtonColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(14.r),
                                                  topRight:
                                                      Radius.circular(14.r),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width,
                                              child: DataTable(
                                                columnSpacing: 0,
                                                headingRowHeight: 49,
                                                columns: [
                                                  DataColumn(
                                                    label: Flexible(
                                                      child: Text(
                                                        "Report ID",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AppStyles
                                                                .workSansTextStyle()
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14.sp,
                                                          color: kWhiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Flexible(
                                                      child: Text(
                                                        "Content Type",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AppStyles
                                                                .workSansTextStyle()
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14.sp,
                                                          color: kWhiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Flexible(
                                                      child: Text(
                                                        "Username",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AppStyles
                                                                .workSansTextStyle()
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14.sp,
                                                          color: kWhiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Flexible(
                                                      child: Text(
                                                        "Reason",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AppStyles
                                                                .workSansTextStyle()
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14.sp,
                                                          color: kWhiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    headingRowAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    label: Flexible(
                                                      child: Text(
                                                        "Status",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AppStyles
                                                                .workSansTextStyle()
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14.sp,
                                                          color: kWhiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    headingRowAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    label: Flexible(
                                                      child: Text(
                                                        "Actions",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AppStyles
                                                                .workSansTextStyle()
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14.sp,
                                                          color: kWhiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                rows: controller
                                                    .currentPageUsers
                                                    .map((report) =>
                                                        _buildDataRow(
                                                            report, context))
                                                    .toList(),
                                                dataRowMaxHeight: 65,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                            SizedBox(
                              height: 51.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: controller.isBackButtonDisabled
                                      ? null
                                      : controller.goToPreviousPage,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: controller.isBackButtonDisabled
                                          ? kWhiteColor
                                          : kButtonColor,
                                      border: Border.all(
                                        color: controller.isBackButtonDisabled
                                            ? kWhiteColor
                                            : kButtonColor,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_back_ios_new_outlined,
                                            size: 12,
                                            color:
                                                controller.isBackButtonDisabled
                                                    ? kBlackColor
                                                    : kWhiteColor),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Back',
                                          style: AppStyles.workSansTextStyle()
                                              .copyWith(
                                            fontSize: 12,
                                            color:
                                                controller.isBackButtonDisabled
                                                    ? kBlackColor
                                                    : kWhiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                ...List.generate(
                                  controller.totalPages,
                                  (index) {
                                    bool isSelected = index + 1 ==
                                        controller.currentPage.value;
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.changePage(index + 1),
                                      child: Padding(
                                        padding:
                                            AppStyles().paginationBtnPadding,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? kButtonColor
                                                : kWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: isSelected
                                                  ? kButtonColor
                                                  : kWhiteColor,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              (index + 1).toString(),
                                              style: AppStyles.interTextStyle()
                                                  .copyWith(
                                                fontSize: 12,
                                                color: isSelected
                                                    ? kWhiteColor
                                                    : kBlackColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                GestureDetector(
                                  onTap: controller.isNextButtonDisabled
                                      ? null
                                      : controller.goToNextPage,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: controller.isNextButtonDisabled
                                          ? kWhiteColor
                                          : kButtonColor,
                                      border: Border.all(
                                          color: controller.isNextButtonDisabled
                                              ? kWhiteColor
                                              : kButtonColor),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Next',
                                          style: AppStyles.workSansTextStyle()
                                              .copyWith(
                                            fontSize: 12,
                                            color:
                                                controller.isNextButtonDisabled
                                                    ? kBlackColor
                                                    : kWhiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 12,
                                            color:
                                                controller.isNextButtonDisabled
                                                    ? kBlackColor
                                                    : kWhiteColor),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }

  DataRow _buildDataRow(ReportModel report, context) {
    return DataRow(
      color: const WidgetStatePropertyAll(kWhiteColor),
      cells: [
        DataCell(Text(
          report.reportId,
          textAlign: TextAlign.center,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          report.post.contentType,
          textAlign: TextAlign.center,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          report.reportedBy.username,
          textAlign: TextAlign.center,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          report.reason,
          textAlign: TextAlign.center,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(
          Center(
            child: Container(
              width: 93.w,
              height: 27,
              decoration: BoxDecoration(
                color: report.status == 'pending'
                    ? kButtonColor.withOpacity(0.2)
                    : kGreenColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  report.status,
                  style: AppStyles.workSansTextStyle().copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: report.status == 'pending'
                          ? kButtonColor
                          : kGreenColor),
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Container(
              height: 32,
              width: 138.w,
              decoration: BoxDecoration(
                  borderRadius: AppStyles.customBorder8,
                  color: kWhiteColor,
                  border: Border.all(color: kTableBorderColor, width: 0.6)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return statusUpdateDialogue(context);
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          kEditIcon,
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ),
                    Container(
                      width: 0.4,
                      color: kTableBorderColor,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteDialog();
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          kDeleteIcon,
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ),
                    Container(
                      width: 0.4,
                      color: kTableBorderColor,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PostDetailDialog(
                                isReportPage: true,
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          kEyeIcon,
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
