import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oga_admin/models/user_model.dart';
import 'package:oga_admin/services/auth_service.dart';
import 'package:oga_admin/utils/app_strings.dart';
import 'package:oga_admin/utils/custom_snackbar.dart';

class AuthController extends GetxController {
  var isChecked = false.obs;
  var isPasswordVisible = false.obs;
  var isOldPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;
  final AuthService _service = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmController =
      TextEditingController();
  var otp = "".obs;
  var isLoading = false.obs;

  void login() async {
    if (!validateSignInEmail() & !validateSignInPassword()) {
      return;
    } else {
      try {
        isLoading(true);
        var result = await _service.signInUser(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        if (result is UserModel) {
          isLoading(false);
          Get.offAllNamed(kDashboardScreenRoute);
          showCustomSnackbar(
            "Success",
            'Logged in successfully',
            backgroundColor: Colors.green,
          );
          return;
        } else {
          isLoading(false);
          showCustomSnackbar(
            "Error",
            result.toString(),
          );
        }
      } catch (e) {
        isLoading(false);
        showCustomSnackbar(
          "Error",
          e.toString(),
        );
      }
    }
  }

  void forgotPassword() async {
    if (forgotEmailController.text.isEmpty) {
      showCustomSnackbar("Error", "Please enter email address");
      return;
    } else {
      try {
        isLoading(true);
        var result = await _service.forgotPassword(
          email: forgotEmailController.text.trim(),
        );
        if (result is bool) {
          isLoading(false);
          Get.toNamed(kVerifyOtpScreenRoute);
          return;
        } else {
          isLoading(false);
          showCustomSnackbar(
            "Error",
            result.toString(),
          );
        }
      } catch (e) {
        isLoading(false);
        showCustomSnackbar(
          "Error",
          e.toString(),
        );
      }
    }
  }

  void verifyOtp() async {
    if (otp.value.length != 4) {
      showCustomSnackbar("Error", "Please enter a valid 4 digit otp code");
      return;
    } else {
      try {
        isLoading(true);
        var result = await _service.verifyOTP(
          email: forgotEmailController.text.trim(),
          otp: otp.value,
        );
        if (result is bool) {
          isLoading(false);
          Get.toNamed(kChangePassScreenRoute);
          return;
        } else {
          isLoading(false);
          showCustomSnackbar(
            "Error",
            result.toString(),
          );
        }
      } catch (e) {
        isLoading(false);
        showCustomSnackbar(
          "Error",
          e.toString(),
        );
      }
    }
  }

  bool validateSignInEmail() {
    if (emailController.text.isEmpty) {
      showCustomSnackbar("Error", "Please enter email address");
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      showCustomSnackbar("Error", "Please enter valid email address");
      return false;
    }
    return true;
  }

  void changePassword() async {
    if (newPasswordController.text.isEmpty ||
        newPasswordConfirmController.text.isEmpty) {
      showCustomSnackbar("Error", "Please enter a valid password");
      return;
    } else if (newPasswordController.text !=
        newPasswordConfirmController.text) {
      showCustomSnackbar("Error", "Passwords does not match");
      return;
    } else {
      try {
        isLoading(true);
        var result = await _service.createNewPassword(
            email: forgotEmailController.text.trim(),
            newPassword: newPasswordController.text.trim());
        if (result is bool) {
          isLoading(false);

          Get.offAllNamed(kLoginScreenRoute);
          showCustomSnackbar("Success", "Password reset successfully",
              backgroundColor: Colors.green);
          return;
        } else {
          isLoading(false);
          showCustomSnackbar(
            "Error",
            result.toString(),
          );
        }
      } catch (e) {
        isLoading(false);
        showCustomSnackbar(
          "Error",
          e.toString(),
        );
      }
    }
  }

  bool validateSignInPassword() {
    if (passwordController.text.isEmpty) {
      showCustomSnackbar("Error", "Please enter password");
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
