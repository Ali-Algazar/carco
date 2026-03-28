import 'package:carco/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(String fontFamily) => ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: AppColors.bgLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.bgLight,
      onSurface: AppColors.textLight,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fourthLight.withValues(alpha: 0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.fourthLight, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.fourthLight, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.5),
      ),
    ),
  );

  static ThemeData darkTheme(String fontFamily) => ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: AppColors.bgDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      surface: AppColors.bgDark,
      onSurface: AppColors.textDark,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.accentDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.thirdDark, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.thirdDark, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryDark, width: 1.5),
      ),
    ),
  );
}
