import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oga_admin/utils/app_styles.dart';
import 'package:oga_admin/utils/route_generator.dart';
import 'utils/app_strings.dart';
import 'utils/screen_bindings.dart';
import '../../../utils/app_colors.dart';


void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: kWhiteColor,
      ),
      primaryColor: kWhiteColor,
      scaffoldBackgroundColor: kWhiteColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kWhiteColor,
        iconTheme: IconThemeData(color: kDarkGrey),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppStyles.poppinsTextStyle().copyWith(fontSize: 16,color: kSecondaryColor,),
        prefixIconColor: kPrimaryColor,
        contentPadding: AppStyles().contentPadding,
        fillColor: kWhiteColor,
        filled: true,
        iconColor: kPrimaryColor,
        hoverColor: kWhiteColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor,width: 1.w),
          borderRadius: AppStyles.customBorderAll,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRedColor,width: 1.w),
          borderRadius: AppStyles.customBorderAll,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppStyles.customBorderAll,
          borderSide: BorderSide(color: kPrimaryColor,width: 1.w),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: kBlackColor, fontSize: 14),
        bodyLarge: TextStyle(color: kBlackColor, fontSize: 14),
        bodyMedium: TextStyle(color: kBlackColor, fontSize: 14),
      ),
      colorScheme: ThemeData().colorScheme.copyWith(primary: kDarkGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            theme: _buildTheme(Brightness.light),
            title: kAppName,
            debugShowCheckedModeBanner: false,
            initialBinding: ScreenBindings(),
            initialRoute: kLoginScreenRoute,
            getPages: RouteGenerator.getPages(),
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaleFactor: MediaQuery.of(context)
                          .textScaleFactor
                          .clamp(1.0, 1.0)),
                  child: child!);
            });
      },
    );
  }
}
