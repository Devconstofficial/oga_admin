import 'package:get/get.dart';
import 'package:oga_admin/utils/screen_bindings.dart';
import 'package:oga_admin/view/screens/auth_screen/change_pass.dart';
import 'package:oga_admin/view/screens/auth_screen/login_screen.dart';
import 'package:oga_admin/view/screens/auth_screen/send_otp.dart';
import 'package:oga_admin/view/screens/auth_screen/verify_otp.dart';
import 'package:oga_admin/view/screens/user_reports/user_reports_screen.dart';
import '../view/screens/dashoboard_screen/dashboard_screen.dart';
import 'app_strings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: kLoginScreenRoute,
          page: () => const LoginScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: kSendOtpScreenRoute,
          page: () => const SendOtpScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: kVerifyOtpScreenRoute,
          page: () => const VerifyOtpScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: kChangePassScreenRoute,
          page: () => const ChangePassScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: kDashboardScreenRoute,
          page: () => const DashboardScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: kUserReportsScreenRoute,
          page: () => UserReportsScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
    ];
  }
}
