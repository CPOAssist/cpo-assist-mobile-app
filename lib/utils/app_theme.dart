import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  static final light = ThemeData(
    fontFamily: fontFamily,
    primaryColor: AppColors.kPrimaryColor,
    primarySwatch: AppColors.kPrimarySwatch,
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp,fontFamily: fontFamily),
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.deepPurple,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
