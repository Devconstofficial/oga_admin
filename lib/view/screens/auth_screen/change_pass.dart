import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textField.dart';
import 'controller/auth_controller.dart';

class ChangePassScreen extends GetView<AuthController> {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () {
          CommonCode.unFocus(context);
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: AppStyles().horizontal28,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 505,
                      child: Column(
                        children: [
                          SizedBox(height: 80.h,),
                          Center(
                            child: SizedBox(
                              height: 150,
                              width: 226,
                              child: Image.asset(kLogo,fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(height: 37.h,),
                          Text(kSetNewPass,
                            style: AppStyles.poppinsTextStyle().copyWith(fontWeight: FontWeight.w600,fontSize: 40,color: kBlackColor  ),textAlign: TextAlign.center,),
                          const SizedBox(height: 2,),
                          Text(kSetNewPassDetail,
                            style: AppStyles.poppinsTextStyle().copyWith(fontWeight: FontWeight.w400,color: kDarkGrey),textAlign: TextAlign.center,),
                          SizedBox(height: 46.h,),
                          Obx(() => MyCustomTextField(
                            hintText: kPasswordHint,
                            fillColor: kWhiteColor,
                            suffixIcon: controller.isOldPasswordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            isObscureText: controller.isOldPasswordVisible.value ? false : true,
                            suffixOnPress: () {
                              controller.isOldPasswordVisible.value =
                              !controller.isOldPasswordVisible.value;
                            },
                            textInputType: TextInputType.text,
                          ),),
                          SizedBox(height: 24.h),
                          Obx(() => MyCustomTextField(
                            hintText: kPasswordHint,
                            fillColor: kWhiteColor,
                            suffixIcon: controller.isNewPasswordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            isObscureText: controller.isNewPasswordVisible.value ? false : true,
                            suffixOnPress: () {
                              controller.isNewPasswordVisible.value =
                              !controller.isNewPasswordVisible.value;
                            },
                            textInputType: TextInputType.text,
                          ),),
                          SizedBox(height: 44.h,),
                          CustomButton(text: kSetNewPass, height: 68.h, onTap: (){
                            Get.toNamed(kLoginScreenRoute);
                          }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

