import 'package:flutter/material.dart';
import 'package:todo_app/style/app_colors.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    dividerColor: AppColors.lightDividerColor,
  );
  static ThemeData darkTheme = ThemeData(
    dividerColor: AppColors.darkDividerColor,
  );
}