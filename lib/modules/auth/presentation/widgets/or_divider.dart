// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomOrDivider extends StatelessWidget {
  CustomOrDivider({super.key, required this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1.0,
            indent: 5,
            color: AppColors.greyColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text!,
            style: AppTextStyle.circularStd700style13,
          ),
        ),
        const Expanded(
          child: Divider(
            endIndent: 5,
            thickness: 1.0,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
