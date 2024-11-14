import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: 'CircularStd',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor:AppColors.primary,
      selectedItemColor: Color(0xFF222222),
      selectedIconTheme: IconThemeData(
        size: 35,
        color: Color(0xFF222222),
      ),
      showUnselectedLabels: false,
      unselectedItemColor: Color(0xFFF8F8F8),
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Color(0xFFF8F8F8),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 30.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    dividerTheme: const DividerThemeData(
      space: 10,
      color: AppColors.primary,
    ),
  );
  
  
  
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: 'CircularStd',
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor:Color(0xFF141A2E),
      selectedItemColor: AppColors.primary,
      selectedIconTheme: IconThemeData(
        size: 35,
        color: AppColors.secondBackground,
      ),
      showUnselectedLabels: false,
      unselectedItemColor: Color(0xFFF8F8F8),
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Color(0xFFF8F8F8),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 30.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 25.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 25.0,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "CircularStd",
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    dividerTheme: const DividerThemeData(
      space: 10,
      color: AppColors.primary,
    ),
  );
}
