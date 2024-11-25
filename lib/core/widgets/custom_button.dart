// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.backGroundColor,
    this.borderColor,
    required this.text,
    required this.onPressed,
    required this.style,
    required this.mainAxisAlignment,
    this.imageIcon,
  });

  final Color? backGroundColor;
  final Color? borderColor;
  final String? text;
  final VoidCallback? onPressed;
  final String? imageIcon;
  TextStyle? style;
  MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (imageIcon != null) ...[
              SvgPicture.asset(imageIcon!),
              const SizedBox(width: 53),
            ],
            Text(
              text!,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
