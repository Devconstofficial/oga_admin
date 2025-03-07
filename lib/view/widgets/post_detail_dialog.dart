import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'package:oga_admin/models/report_model.dart';
import 'package:oga_admin/models/user_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

// ignore: must_be_immutable
class PostDetailDialog extends StatefulWidget {
  bool? isReportPage;
  UserModel? userData;
  ReportModel? reportData;
  final Function() onTap;
  RxBool? isLoading;
  PostDetailDialog(
      {super.key,
      this.isReportPage,
      this.userData,
      this.reportData,
      required this.onTap,
      this.isLoading});

  @override
  PostDetailDialogState createState() => PostDetailDialogState();
}

class PostDetailDialogState extends State<PostDetailDialog> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = "";
    String formattedTime = "";

    if (widget.isReportPage == true && widget.reportData != null) {
      String dateString = widget.reportData!.post.createdAt;
      DateTime dateTime = DateTime.parse(dateString);
      formattedDate = DateFormat("M/d/yy").format(dateTime);
      formattedTime = DateFormat("hh:mm a").format(dateTime);
    }

    String formatLikes(int likes) {
      if (likes >= 1000000) {
        return "${(likes / 1000000).toStringAsFixed(1)}M";
      } else if (likes >= 1000) {
        return "${(likes / 1000).toStringAsFixed(1)}k";
      } else {
        return likes.toString();
      }
    }

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
                              ? "@${widget.reportData!.reportedBy.username} Post"
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
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Expanded(
                                  child: Text(
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      widget.isReportPage == true
                                          ? widget.reportData!.post.content
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
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Text(
                                  widget.isReportPage == true
                                      ? formattedDate
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
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Text(
                                  widget.isReportPage == true
                                      ? formattedTime
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
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Text(
                                  widget.isReportPage == true
                                      ? widget.reportData!.post.tags.join(', ')
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
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: kBlackColor2)),
                              Text(
                                  widget.isReportPage == true
                                      ? formatLikes(
                                          widget.reportData!.post.likes.length)
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
                            image: widget.isReportPage == true
                                ? widget.reportData!.post.link
                                : widget.userData!.profilePicture,
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
                if (widget.isReportPage == true) ...[
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Text("Report Detail: ",
                          style: AppStyles.poppinsTextStyle().copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: kBlackColor2)),
                      Text(widget.reportData!.reason,
                          style: AppStyles.poppinsTextStyle().copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: kBlackColor2)),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Divider(
                    color: kLightGreyColor.withOpacity(0.4),
                    thickness: 0.4,
                  ),
                ],
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
                    Obx(() => widget.isLoading!.value == true
                        ? SizedBox(
                            width: 112.w,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: kDarkGrey,
                              ),
                            ),
                          )
                        : widget.isReportPage == true
                            ? CustomButton(
                                text:
                                    widget.reportData!.post.status == 'blocked'
                                        ? "Blocked"
                                        : "Block Post",
                                height: 40,
                                onTap:
                                    widget.reportData!.post.status != 'blocked'
                                        ? widget.onTap
                                        : () {},
                                width: 112,
                                borderColor:
                                    widget.reportData!.post.status == 'blocked'
                                        ? kRedColor
                                        : kButtonColor,
                                color:
                                    widget.reportData!.post.status == 'blocked'
                                        ? kRedColor
                                        : kButtonColor,
                                textColor: kWhiteColor,
                                fontSize: 14,
                              )
                            : CustomButton(
                                text: "Delete User",
                                height: 40,
                                onTap: widget.onTap,
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
