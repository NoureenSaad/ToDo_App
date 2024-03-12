import 'package:flutter/material.dart';
import 'package:todo_app/style/app_colors.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25),
      color: AppColors.primaryLightColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLightColor
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.unselectedItemColor,
      selectedItemColor: AppColors.primaryLightColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryLightColor,
      primary: AppColors.primaryLightColor,),
    useMaterial3: false,

  );
  static ThemeData darkTheme = ThemeData();
}