// ignore_for_file: must_be_immutable, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopify/core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/app_vectors.dart';
import '../../../../core/widgets/custom_button.dart';

class CustomSocialButtons extends StatelessWidget {
  const CustomSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          imageIcon: AppVectors.google,
          text: AppStrings.google,
          backGroundColor: AppColors.lightBackground,
          borderColor: const Color(0xFFDDDFDF),
          onPressed: () {},
          style: AppTextStyle.circularStd600style16,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        const SizedBox(height: 16),
        Platform.isIOS
            ? CustomButton(
                imageIcon: AppVectors.apple,
                text: AppStrings.apple,
                backGroundColor: AppColors.lightBackground,
                borderColor: const Color(0xFFDDDFDF),
                onPressed: () {},
                style: AppTextStyle.circularStd600style16,
                mainAxisAlignment: MainAxisAlignment.start,
              )
            : const SizedBox(),
        CustomButton(
          imageIcon: AppVectors.facebook,
          text: AppStrings.facebook,
          backGroundColor: AppColors.lightBackground,
          borderColor: const Color(0xFFDDDFDF),
          onPressed: () {},
          style: AppTextStyle.circularStd600style16,
          mainAxisAlignment: MainAxisAlignment.start,
        )
      ],
    );
  }
}
