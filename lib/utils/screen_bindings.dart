import 'package:get/get.dart';
import 'package:oga_admin/view/screens/auth_screen/controller/auth_controller.dart';
import 'package:oga_admin/view/screens/dashoboard_screen/controller/dashboard_controller.dart';
import 'package:oga_admin/view/screens/user_reports/controller/user_report_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => UserReportsController());
  }
}
