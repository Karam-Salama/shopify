// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/cutom_text_form_field.dart';
import '../pages/forget_password_page.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

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
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppStrings.password,
            keyboardType: TextInputType.visiblePassword,
            validator: Validation.validatePassword,
            onSaved: (password) {},
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                customNavigate(context, ForgetPasswordPage.routeName);
              },
              child: Text(
                AppStrings.forgotPassword,
                style: AppTextStyle.circularStd500style16
                    .copyWith(color: AppColors.lightPrimary),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: AppStrings.login,
            onPressed: () {},
            style: AppTextStyle.circularStd500style16,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
