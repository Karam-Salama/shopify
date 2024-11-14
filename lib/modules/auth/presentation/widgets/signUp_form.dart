// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_terms_and_conds_widget.dart';
import '../../../../core/widgets/cutom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: CustomTextFormField(
                hintText: AppStrings.firstName,
                keyboardType: TextInputType.name,
                validator: Validation.validateName,
                onSaved: (name) {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextFormField(
                hintText: AppStrings.lastName,
                keyboardType: TextInputType.name,
                validator: Validation.validateName,
                onSaved: (name) {},
              ),
            ),
          ]),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppStrings.email,
            keyboardType: TextInputType.emailAddress,
            validator: Validation.validateEmail,
            onSaved: (email) {},
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppStrings.password,
            keyboardType: TextInputType.visiblePassword,
            validator: Validation.validatePassword,
            onSaved: (password) {},
          ),
          const SizedBox(height: 8),
          const TermsAndConditionsWidget(),
          const SizedBox(height: 30),
          CustomButton(
            text: AppStrings.register,
            onPressed: () {},
            style: AppTextStyle.circularStd500style16,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
