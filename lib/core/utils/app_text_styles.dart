// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';

import 'app_colors.dart'; // Import this for TextStyle

abstract class AppTextStyle {
  static final circularStd26Boldstyle = const TextStyle(
    fontFamily: 'CircularStd',
    fontWeight: FontWeight.bold,
    fontSize: 26,
    color: AppColors.blackColor,
  );
  static final circularStd600style16 = const TextStyle(
    fontFamily: 'CircularStd',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.blackColor,
  );
  static final circularStd700style13 = const TextStyle(
    fontFamily: 'CircularStd',
    fontWeight: FontWeight.w700,
    fontSize: 13,
    color: AppColors.greyColor,
  );
  static final circularStd500style16 = const TextStyle(
    fontFamily: 'CircularStd',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.whiteColor,
  );
}
