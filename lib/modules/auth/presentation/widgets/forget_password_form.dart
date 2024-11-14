import 'package:flutter/material.dart';
import 'package:shopify/core/functions/navigation.dart';

import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/cutom_text_form_field.dart';
import '../pages/confirmation_page.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppStrings.email,
            keyboardType: TextInputType.emailAddress,
            validator: Validation.validateEmail,
            onChanged: (email) {},
          ),
          const SizedBox(height: 50),
          CustomButton(
            text: AppStrings.forgottingPassword,
            onPressed: () {
              customReplacementNavigate(context, ConfirmationPage.routeName);
            },
            style: AppTextStyle.circularStd500style16,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}



