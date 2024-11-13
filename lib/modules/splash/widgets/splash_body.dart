import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify/core/utils/app_colors.dart';
import '../../../core/utils/app_vectors.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: SvgPicture.asset(AppVectors.appLogo)),
    );
  }
}
