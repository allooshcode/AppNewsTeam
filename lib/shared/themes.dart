import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.main,
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      // backgroundColor: AppColors.scaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.scaffoldBackground,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.main,
        unselectedItemColor: Colors.grey,
        elevation: 20.0,
      ),
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.scaffoldBackground),
          titleTextStyle: TextStyle(
              color: AppColors.main, fontSize: 22, fontWeight: FontWeight.bold),
          titleSpacing: 20.0,
          backgroundColor: AppColors.scaffoldBackground,
          // color: AppColors.scaffoldBackground,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.main)));

  static final ThemeData darkTheme = ThemeData(
      // primaryColor: Colors.white,
      primarySwatch: Colors.deepOrange,
      textTheme: TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      ),
      // backgroundColor: HexColor('333739'),
      scaffoldBackgroundColor: HexColor('333739'),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor('333739'),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.main,
        unselectedItemColor: Colors.grey,
        elevation: 20.0,
      ),
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: HexColor('333739')),
          titleTextStyle: TextStyle(
              color: AppColors.main, fontSize: 22, fontWeight: FontWeight.bold),
          titleSpacing: 20.0,
          backgroundColor: HexColor('333739'),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)));
}
