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
      GetPage(name: kLoginScreenRoute, page: () => const LoginScreen(), binding: ScreenBindings()),
      GetPage(name: kSendOtpScreenRoute, page: () => const SendOtpScreen(), binding: ScreenBindings()),
      GetPage(name: kVerifyOtpScreenRoute, page: () => const VerifyOtpScreen(), binding: ScreenBindings()),
      GetPage(name: kChangePassScreenRoute, page: () => const ChangePassScreen(), binding: ScreenBindings()),
      GetPage(name: kDashboardScreenRoute, page: () => const DashboardScreen(), binding: ScreenBindings()),
      GetPage(name: kUserReportsScreenRoute, page: () => const UserReportsScreen(), binding: ScreenBindings()),
    ];
  }
}
