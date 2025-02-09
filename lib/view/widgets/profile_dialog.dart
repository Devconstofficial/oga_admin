import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:oga_admin/view/screens/dashoboard_screen/controller/dashboard_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_textField.dart';

class ProfileDialog extends StatefulWidget {
  const ProfileDialog({super.key});

  @override
  ProfileDialogState createState() => ProfileDialogState();
}

class ProfileDialogState extends State<ProfileDialog> {
  DashboardController controller = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: kBackColor,
        shape: RoundedRectangleBorder(
            borderRadius: AppStyles.customBorder8,
            side: const BorderSide(color: Colors.transparent)
        ),
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
                        Obx(() => Container(
                          height: 109,
                          width: 109,
                          decoration: BoxDecoration(
                              borderRadius: AppStyles.customBorderAll100,
                              border: Border.all(width: 5,color: kButtonColor)
                          ),
                          child: ClipRRect(
                            borderRadius: AppStyles.customBorderAll100,
                            child: controller.selectedImage.value == null
                                ? Image.asset(kAvatarImage,fit: BoxFit.cover,) : Image.memory(
                              controller.selectedImage.value!,
                              fit: BoxFit.cover,
                            ),),
                        ),),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: (){
                              controller.pickImage();
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: kWhiteColor,
                              child: Center(child: SvgPicture.asset(kEdit1Icon,height: 20,width: 20,)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                Text("First Name",
                    style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w500,fontSize: 14,color: kBlackColor2)),
                SizedBox(height: 8.h),
                const SizedBox(
                  height: 40,
                  child: MyCustomTextField(
                    hintText: "First Name",
                    fillColor: kBackColor,
                    hoverColor: kBackColor,
                    contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                  ),
                ),
                SizedBox(height: 8.h),
                Text("Last Name",
                    style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w500,fontSize: 14,color: kBlackColor2)),
                SizedBox(height: 8.h),
                const SizedBox(
                  height: 40,
                  child: MyCustomTextField(
                    hintText: "Last Name",
                    hoverColor: kBackColor,
                    fillColor: kBackColor,
                    contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(text: "Cancel", height: 40, onTap: (){
                      Get.back();
                    },width: 75,borderColor: kGray3Color,color: kBackColor,textColor: kBlackColor1,fontSize: 14,),
                    CustomButton(text: "Update", height: 40, onTap: (){
                      Get.back();
                    },width: 75,borderColor: kButtonColor,color: kButtonColor,textColor: kWhiteColor,fontSize: 14,),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
