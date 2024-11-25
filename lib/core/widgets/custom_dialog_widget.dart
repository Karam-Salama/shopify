import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_button.dart';

class CustomDialog extends StatelessWidget {
  final IconData? icon;
  final String message;
  final String textButton;
  final VoidCallback? onpressed;

  const CustomDialog({
    super.key,
    required this.message,
    this.icon,
    required this.textButton,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppTextStyle.circularStd500style16.copyWith(
              color: AppColors.blackColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CustomButton(
            style: AppTextStyle.circularStd500style16,
            mainAxisAlignment: MainAxisAlignment.center,
            text: textButton,
            backGroundColor: AppColors.primary,
            onPressed: onpressed!,
          ),
        ],
      ),
    );
  }
}
