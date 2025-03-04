import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:oga_admin/models/user_model.dart';
import 'package:oga_admin/view/screens/dashoboard_screen/controller/dashboard_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

// ignore: must_be_immutable
class PostDetailDialog extends StatefulWidget {
  bool? isReportPage;
  UserModel? userData;
  PostDetailDialog({super.key, this.isReportPage, this.userData});

  @override
  PostDetailDialogState createState() => PostDetailDialogState();
}

class PostDetailDialogState extends State<PostDetailDialog> {
  DashboardController controller = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: kBackColor,
        shape: RoundedRectangleBorder(
            borderRadius: AppStyles.customBorder8,
            side: const BorderSide(color: Colors.transparent)),
        child: SizedBox(
          width: 700,
          child: Padding(
            padding: AppStyles().paddingAll24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: kLightGreyColor.withOpacity(0.4),
                              width: 0.4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          widget.isReportPage == true
                              ? "@karennne Post"
                              : "General Info",
                          style: AppStyles.poppinsTextStyle().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: kBlackColor2)),
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
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  widget.isReportPage == true
                                      ? "Post Content: "
                                      : "Name: ",
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Expanded(
                                  child: Text(
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      widget.isReportPage == true
                                          ? kComment
                                          : widget.userData!.name,
                                      style: AppStyles.poppinsTextStyle()
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: kBlackColor2))),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                  widget.isReportPage == true
                                      ? "Post Date: "
                                      : "Email: ",
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Text(
                                  widget.isReportPage == true
                                      ? "2/21/20"
                                      : widget.userData!.email,
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: kBlackColor2)),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                  widget.isReportPage == true
                                      ? "Post Time: "
                                      : "Location: ",
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Text(
                                  widget.isReportPage == true
                                      ? "09:28 AM"
                                      : widget.userData!.location,
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: kBlackColor2)),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                  widget.isReportPage == true
                                      ? "Post Type: "
                                      : "Contact: ",
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Text(
                                  widget.isReportPage == true
                                      ? "Comedy, Book"
                                      : widget.userData!.phoneNumber,
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: kBlackColor2)),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                  widget.isReportPage == true
                                      ? "Reaction: "
                                      : "Profile Visibility: ",
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Text(
                                  widget.isReportPage == true
                                      ? "11k"
                                      : widget.userData!.visibility,
                                  style: AppStyles.poppinsTextStyle().copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: kBlackColor2)),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 126,
                        width: 126,
                        decoration: BoxDecoration(
                          color: kLightGreyColor.withOpacity(0.5),
                          borderRadius: AppStyles.customBorderAll100,
                        ),
                        child: ClipRRect(
                          borderRadius: AppStyles.customBorderAll100,
                          child: ImageNetwork(
                            image: widget.userData!.profilePicture,
                            width: 126,
                            height: 126,
                            duration: 1500,
                            curve: Curves.easeIn,
                            onPointer: true,
                            debugPrint: false,
                            fitAndroidIos: BoxFit.cover,
                            fitWeb: BoxFitWeb.cover,
                            onError: Icon(Icons.broken_image,
                                size: 40.sp, color: kDarkGrey),
                            onLoading: const CircularProgressIndicator(
                              color: kDarkGrey,
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 24.h),
                Divider(
                  color: kLightGreyColor.withOpacity(0.4),
                  thickness: 0.4,
                ),
                SizedBox(height: 24.h),
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
                      borderColor: kGray3Color,
                      color: kBackColor,
                      textColor: kBlackColor1,
                      fontSize: 14,
                    ),
                    Obx(() => controller.isDeleting.value
                        ? SizedBox(
                            width: 106.w,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: kDarkGrey,
                              ),
                            ),
                          )
                        : CustomButton(
                            text: widget.isReportPage == true
                                ? "Block User"
                                : "Delete User",
                            height: 40,
                            onTap: () {
                              if (widget.isReportPage == false) {
                                controller.deleteUser(
                                    id: widget.userData!.userId);
                              }
                            },
                            width: 112,
                            borderColor: kButtonColor,
                            color: kButtonColor,
                            textColor: kWhiteColor,
                            fontSize: 14,
                          )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
