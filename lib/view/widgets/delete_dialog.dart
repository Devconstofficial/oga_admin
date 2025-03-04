import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:oga_admin/view/screens/dashoboard_screen/controller/dashboard_controller.dart';
import 'package:oga_admin/view/screens/user_reports/controller/user_report_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

class DeleteDialog extends StatefulWidget {
  final void Function() onDelete;
  const DeleteDialog({
    super.key,
    required this.onDelete,
  });

  @override
  DeleteDialogState createState() => DeleteDialogState();
}

class DeleteDialogState extends State<DeleteDialog> {
  final DashboardController controller = Get.find();
  final UserReportsController userReportsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: kBackColor,
        shape: RoundedRectangleBorder(
            borderRadius: AppStyles.customBorder8,
            side: const BorderSide(color: Colors.transparent)),
        child: SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      topLeft: Radius.circular(8.r)),
                  color: kButtonColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        kDeleteEntry,
                        style: AppStyles.workSansTextStyle().copyWith(
                            fontWeight: FontWeight.w500,
                            color: kWhiteColor,
                            fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: SvgPicture.asset(
                              kCrossIcon,
                              height: 14.h,
                              width: 14.w,
                              colorFilter: const ColorFilter.mode(
                                  kWhiteColor, BlendMode.srcIn),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  kDeleteDetail,
                  style: AppStyles.poppinsTextStyle()
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: "Cancel",
                      height: 40,
                      onTap: () {
                        Get.back();
                      },
                      width: 75,
                      borderColor: kGray3Color,
                      color: kBackColor,
                      textColor: kBlackColor1,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Obx(() => controller.isDeleting.value ||
                            userReportsController.isDeleting.value
                        ? SizedBox(
                            width: 75.w,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: kDarkGrey,
                              ),
                            ),
                          )
                        : CustomButton(
                            text: "Delete",
                            height: 40,
                            onTap: widget.onDelete,
                            width: 75,
                            borderColor: kButtonColor,
                            color: kButtonColor,
                            textColor: kWhiteColor,
                            fontSize: 14,
                          )),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ));
  }
}
