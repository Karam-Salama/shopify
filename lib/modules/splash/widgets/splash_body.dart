import 'package:flutter/material.dart';
import 'package:shopify/core/utils/app_colors.dart';
import 'package:shopify/core/utils/app_images.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: Image.asset(AppImages.logo)),
    );
  }
}
