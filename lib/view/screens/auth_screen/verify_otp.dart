import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oga_admin/utils/app_strings.dart';
import 'package:otp_text_field/style.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../widgets/custom_button.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'controller/auth_controller.dart';
import 'package:otp_text_field/otp_field.dart';


class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    double width = MediaQuery.of(context).size.width;

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
                              height: 150.h,
                              width: 226.w,
                              child: Image.asset(kLogo,fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(height: 37.h,),
                          Text(kConfirmOTP,
                            style: AppStyles.poppinsTextStyle().copyWith(fontWeight: FontWeight.w600,fontSize: 40,color: kBlackColor),textAlign: TextAlign.center,),
                          const SizedBox(height: 2,),
                          Text(kConfirmOTPDetail,
                            style: AppStyles.poppinsTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 16,color: kDarkGrey),textAlign: TextAlign.center,),
                          SizedBox(height: 44.h,),
                          OTPTextField(
                            // controller: controller.otpController,
                            length: 5,
                            width: MediaQuery.of(context).size.width,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldWidth: 56,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10),
                            otpFieldStyle: OtpFieldStyle(focusBorderColor: kPrimaryColor,),
                            fieldStyle: FieldStyle.underline,
                            outlineBorderRadius: 10.r,
                            style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w700),
                            onChanged: (pin){

                            },
                            onCompleted: (pin) async {

                            },
                          ),
                          SizedBox(height: 32.h,),
                          CustomButton(text: kVerifyOTP, height: 68.h, onTap: (){
                            Get.toNamed(kChangePassScreenRoute);
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

