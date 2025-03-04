import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:oga_admin/view/screens/dashoboard_screen/controller/dashboard_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_textField.dart';

class ProfileDialog extends StatefulWidget {
  const ProfileDialog({super.key});

  @override
  ProfileDialogState createState() => ProfileDialogState();
}

class ProfileDialogState extends State<ProfileDialog> {
  DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = controller.user.value!.name.split(" ");
    String firstPart = nameParts.isNotEmpty ? nameParts.first : "";
    String secondPart = nameParts.length > 1 ? nameParts.last : "";
    final TextEditingController firstNameCont =
        TextEditingController(text: firstPart);
    final TextEditingController lastNameCont =
        TextEditingController(text: secondPart);
    return Dialog(
        backgroundColor: kBackColor,
        shape: RoundedRectangleBorder(
            borderRadius: AppStyles.customBorder8,
            side: const BorderSide(color: Colors.transparent)),
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: AppStyles().paddingAll24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  height: 29.h,
                ),
                Center(
                  child: SizedBox(
                    height: 109,
                    width: 109,
                    child: Stack(
                      children: [
                        Obx(
                          () => Container(
                            height: 109,
                            width: 109,
                            decoration: BoxDecoration(
                                borderRadius: AppStyles.customBorderAll100,
                                border:
                                    Border.all(width: 5, color: kButtonColor)),
                            child: ClipRRect(
                              borderRadius: AppStyles.customBorderAll100,
                              child: controller.selectedImage.value != null
                                  ? Image.memory(
                                      controller.selectedImage.value!,
                                      fit: BoxFit.cover,
                                    )
                                  : controller
                                          .user.value!.profilePicture.isEmpty
                                      ? Image.asset(
                                          kUserImage,
                                          fit: BoxFit.cover,
                                        )
                                      : ImageNetwork(
                                          image: controller
                                              .user.value!.profilePicture,
                                          width: 109,
                                          height: 109,
                                          duration: 1500,
                                          curve: Curves.easeIn,
                                          onPointer: true,
                                          debugPrint: false,
                                          fitAndroidIos: BoxFit.cover,
                                          fitWeb: BoxFitWeb.cover,
                                          onError: Icon(Icons.broken_image,
                                              size: 40.sp, color: kWhiteColor),
                                          onLoading:
                                              const CircularProgressIndicator(
                                            color: kWhiteColor,
                                          ),
                                          imageCache: AssetImage(kUser1Image),
                                        ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              controller.pickImage();
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: kWhiteColor,
                              child: Center(
                                  child: SvgPicture.asset(
                                kEdit1Icon,
                                height: 20,
                                width: 20,
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                Text("First Name",
                    style: AppStyles.workSansTextStyle().copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: kBlackColor2)),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40,
                  child: MyCustomTextField(
                    controller: firstNameCont,
                    hintText: "First Name",
                    fillColor: kBackColor,
                    hoverColor: kBackColor,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
                SizedBox(height: 8.h),
                Text("Last Name",
                    style: AppStyles.workSansTextStyle().copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: kBlackColor2)),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40,
                  child: MyCustomTextField(
                    controller: lastNameCont,
                    hintText: "Last Name",
                    hoverColor: kBackColor,
                    fillColor: kBackColor,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
                SizedBox(height: 32.h),
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
                    Obx(() => controller.isUpdatingProfile.value
                        ? SizedBox(
                            width: 75.w,
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: kDarkGrey,
                            )))
                        : CustomButton(
                            text: "Update",
                            height: 40,
                            onTap: () {
                              print("$firstNameCont $lastNameCont");
                              controller.updateUserProfile(
                                  name:
                                      "${firstNameCont.text.trim()} ${lastNameCont.text.trim()}");
                            },
                            width: 75,
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
