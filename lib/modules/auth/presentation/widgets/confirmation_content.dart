import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/app_vectors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../pages/signIn_page.dart';

class ConfirmationContent extends StatelessWidget {
  const ConfirmationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.emailSending),
        const SizedBox(height: 16),
        Text(
          AppStrings.confirmationSubTitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.circularStd26Boldstyle,
        ),
        const SizedBox(height: 30),
        CustomButton(
          text: AppStrings.confirmation,
          onPressed: () {
            customNavigate(context, SignInPage.routeName);
          },
          style: AppTextStyle.circularStd500style16,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
