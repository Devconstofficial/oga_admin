import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'controller/menu_controller.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final menuController = Get.put(MenuControllers());

  @override
  Widget build(BuildContext context) {
    // bool isTablet = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Drawer(
        backgroundColor: kButtonColor,
        width: 260.w,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: kButtonColor,
            width: 0.01.w
          )
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0)
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 150,
                  child: DrawerHeader(
                    child: Column(
                      children: [
                        SizedBox(
                            height: 92,
                            width: 138,
                            child: Image.asset(kLogoWhite,fit: BoxFit.contain,)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                menuController.onItemTapped(0);
                                Get.toNamed(kDashboardScreenRoute);
                              },
                              child: Container(
                                height: 58.h,
                                decoration: BoxDecoration(
                                  color: menuController.selectedIndex.value == 0 ? kWhiteColor : kButtonColor,
                                  borderRadius: AppStyles.customBorder16,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only( left: 27.w),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        kDashboardIcon,
                                        height: 26.h,
                                        width: 26.w,
                                        color: menuController.selectedIndex.value == 0 ? kButtonColor : kWhiteColor,
                                      ),
                                      SizedBox(width: 12.w,),
                                      Text(
                                          kDashboard,
                                          style: AppStyles.poppinsTextStyle().copyWith(
                                            color: menuController.selectedIndex.value == 0
                                                ? kButtonColor
                                                : kWhiteColor,
                                            fontSize: menuController.selectedIndex.value == 0 ? 18.sp : 16.sp,
                                            fontWeight: menuController.selectedIndex.value == 0 ? FontWeight.w600 : FontWeight.w400
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 30.h,),
                        Obx(() {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                menuController.onItemTapped(1);
                                Get.toNamed(kUserReportsScreenRoute);
                              },
                              child: Container(
                                  height: 58.h,
                                  decoration: BoxDecoration(
                                    color: menuController.selectedIndex.value == 1 ? kWhiteColor : kButtonColor,
                                    borderRadius: AppStyles.customBorder16,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only( left: 27.w),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          kUserIcon,
                                          height: 26.h,
                                          width: 26.w,
                                          colorFilter: ColorFilter.mode(
                                            menuController.selectedIndex.value == 1 ? kButtonColor : kWhiteColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        SizedBox(width: 12.w,),
                                        Text(
                                          kUserReports,
                                          style: AppStyles.poppinsTextStyle().copyWith(
                                              color: menuController.selectedIndex.value == 1
                                                  ? kButtonColor
                                                  : kWhiteColor,
                                              fontSize: menuController.selectedIndex.value == 1 ? 18.sp : 16.sp,
                                              fontWeight: menuController.selectedIndex.value == 1 ? FontWeight.w600 : FontWeight.w400
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    menuController.onItemTapped(2);
                    Get.offAllNamed(kLoginScreenRoute);
                  },
                  child: SizedBox(
                    width: width,
                    height: 49.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                              height: 49.h,
                              child: Padding(
                                padding: EdgeInsets.only( left: 24.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      kLogoutIcon,
                                      height: 22.h,
                                      width: 22.w,
                                      colorFilter: const ColorFilter.mode(
                                        kWhiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    SizedBox(width: 16.w,),
                                    Text(
                                      "Logout",
                                      style: AppStyles.poppinsTextStyle().copyWith(
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15.sp
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 52.h)
            ],
          ),
        ),
      ),
    );
  }
}
