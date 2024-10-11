import 'package:flutter/material.dart';

class AppColors {
  static const Color accent = Color(0xff32cd32); // Light green accent
  static const Color text = Color(0xffffffff); // White text
  static const Color textLight = Color(0xffb0b0b0); // Light grey text
  static const Color black = Color(0xff000000); // Black background
  static const Color cardBackground = Color(0xff1c1c1c); // Dark for cards
}

class Themes {
  static ThemeData defaultTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      elevation: 2,
      backgroundColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.text),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.text,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accent,
      secondary: AppColors.accent,
    ),
    cardColor: AppColors.cardBackground,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.text),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
  );
}

class TextStyles {
  static TextStyle heading1 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontSize: 48,
  );

  static TextStyle heading2 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontSize: 32,
  );

  static TextStyle heading3 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontSize: 24,
  );

  static TextStyle body1 = const TextStyle(
    fontWeight: FontWeight.normal,
    color: AppColors.text,
    fontSize: 18,
  );

  static TextStyle body2 = const TextStyle(
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    fontSize: 16,
  );

  static TextStyle button = const TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.accent,
    fontSize: 16,
  );
}
