import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:oga_admin/utils/app_strings.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textField.dart';
import 'controller/auth_controller.dart';

class SendOtpScreen extends GetView<AuthController> {
  const SendOtpScreen({super.key});

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
                          Text(kForgotPass,
                            style: AppStyles.poppinsTextStyle().copyWith(fontWeight: FontWeight.w600,fontSize: 40,color: kBlackColor),textAlign: TextAlign.center,),
                          const SizedBox(height: 2,),
                          Text(kForgotPassDetail,
                            style: AppStyles.poppinsTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 16,color: kDarkGrey),textAlign: TextAlign.center,),
                          SizedBox(height: 44.h),
                          Row(
                            children: [
                              Text(kEmailAddress,
                                style: AppStyles.poppinsTextStyle().copyWith(fontWeight: FontWeight.w500,fontSize: 16,color: kSecondaryColor1)),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          MyCustomTextField(
                            hintText: kEmailAddressHint,
                            fillColor: kWhiteColor,
                          ),
                          SizedBox(height: 32.h,),
                          CustomButton(text: "Submit", height: 68.h, onTap: (){
                            Get.toNamed(kVerifyOtpScreenRoute);
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

