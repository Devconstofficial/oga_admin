import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {

  static TextStyle poppinsTextStyle() => GoogleFonts.poppins(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: kDarkGrey);

  static TextStyle workSansTextStyle() => GoogleFonts.workSans(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: kDarkGrey);

  static TextStyle interTextStyle() => GoogleFonts.inter(
      fontSize: 14.sp, fontWeight: FontWeight.w700, color: kDarkGrey);


  static BorderRadius get customBorderAll => BorderRadius.all(
    Radius.circular(6.r),
  );

  static BorderRadius get searchFieldBorder20=> BorderRadius.all(
    Radius.circular(20.r),
  );

  static BorderRadius get customBorder16=> BorderRadius.all(
    Radius.circular(16.r),
  );

  static BorderRadius get customBorder12=> BorderRadius.all(
    Radius.circular(12.r),
  );

  static BorderRadius get customBorderAll100 => BorderRadius.all(
    Radius.circular(100.r),
  );

  static BorderRadius get customBorder8 => BorderRadius.all(
    Radius.circular(8.r),
  );

  static BorderRadius get customBorder10 => BorderRadius.all(
    Radius.circular(10.r),
  );



  EdgeInsets get horizontal28 => EdgeInsets.symmetric(horizontal: 28.w);
  EdgeInsets get horizontal32 => EdgeInsets.symmetric(horizontal: 30.w);
  EdgeInsets get appBarPadding => EdgeInsets.only(left: 28.0.w,right: 10.w,top: 30);
  EdgeInsets get paginationBtnPadding => EdgeInsets.symmetric(horizontal: 6.0.w);
  EdgeInsets get paddingAll20 => const EdgeInsets.all(20.0);
  EdgeInsets get paddingAll24 => const EdgeInsets.all(24.0);
  EdgeInsets get paddingAll32 => const EdgeInsets.all(32.0);
  EdgeInsets get paddingAll16 => const EdgeInsets.all(16.0);
  EdgeInsets get contentPadding => EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h);

}


