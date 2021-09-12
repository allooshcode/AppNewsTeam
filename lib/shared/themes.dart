
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/colors.dart';

MaterialColor primarySwatch =MaterialColor(0xFFFF5252, {50: Color(0xFFFF5252),
100: Color(0xFFFF5252),
200: Color(0xFFFF5252),
300: Color(0xFFFF5252),
400: Color(0xFFFF5252),
500: Color(0xFFFF5252),
600: Color(0xFFFF5252),
700: Color(0xFFFF5252),
800: Color(0xFFFF5252),
900: Color(0xFFFF5252)},);


/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
///
class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: AppColors.main,
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: AppColors.textSubTitle1Light, fontWeight: FontWeight.bold,),
      subtitle2: TextStyle(color: AppColors.textSubTitle2Light,),
      caption: TextStyle(color: AppColors.textCaptionLight,),
    ),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColors.scaffoldBackgroundLight,
      titleSpacing: 12.0,
      iconTheme: IconThemeData(color: Colors.black),
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.scaffoldBackgroundLight,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldBackgroundLight,
      selectedItemColor: AppColors.main,
      unselectedItemColor: Colors.grey,
      elevation: 2,
    ),
  );

  static final ThemeData dark = ThemeData(
    primaryColor: AppColors.main,
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: AppColors.textSubTitle1Dark, fontWeight: FontWeight.bold,),
      subtitle2: TextStyle(color: AppColors.textSubTitle2Dark,),
      caption: TextStyle(color: AppColors.textCaptionDark,),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColors.scaffoldBackgroundDark,
      titleSpacing: 12.0,
      iconTheme: IconThemeData(color: Colors.white),
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.scaffoldBackgroundDark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldBackgroundDark,
      selectedItemColor: AppColors.main,
      unselectedItemColor: Colors.grey,
      elevation: 2,
    ),
  );
}