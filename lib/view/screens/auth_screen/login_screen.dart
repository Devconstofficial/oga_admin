import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textField.dart';
import 'controller/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          CommonCode.unFocus(context);
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: AppStyles().paddingAll32,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 505,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80.h,
                          ),
                          Center(
                            child: SizedBox(
                              height: 150.h,
                              width: 226.w,
                              child: Image.asset(
                                kLogo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 46.h,
                          ),
                          Text(kEmailAddress,
                              style: AppStyles.poppinsTextStyle().copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: kSecondaryColor1)),
                          SizedBox(height: 8.h),
                          MyCustomTextField(
                            controller: controller.emailController,
                            hintText: kEmailAddressHint,
                            fillColor: kWhiteColor,
                          ),
                          SizedBox(height: 24.h),
                          Text(kPassword,
                              style: AppStyles.poppinsTextStyle().copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: kSecondaryColor1)),
                          SizedBox(height: 8.h),
                          Obx(
                            () => MyCustomTextField(
                              controller: controller.passwordController,
                              hintText: kPasswordHint,
                              fillColor: kWhiteColor,
                              suffixIcon: controller.isPasswordVisible.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              isObscureText: controller.isPasswordVisible.value
                                  ? false
                                  : true,
                              suffixOnPress: () {
                                controller.isPasswordVisible.value =
                                    !controller.isPasswordVisible.value;
                              },
                              textInputType: TextInputType.text,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(kSendOtpScreenRoute);
                                },
                                child: Text(kForgotPass,
                                    style: AppStyles.poppinsTextStyle()
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: kButtonColor)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Obx(() => controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: kDarkGrey,
                                ))
                              : CustomButton(
                                  text: kLogIn,
                                  height: 68.h,
                                  onTap: () {
                                    controller.login();
                                  })),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
