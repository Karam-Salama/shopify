// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/build_custom_dialog.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import '../../../../core/widgets/cutom_text_form_field.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/sign_in_cubit.dart';
import '../pages/forget_password_page.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          buildCustomDialog(
            context,
            CustomDialog(
              icon: Icons.check_circle,
              message: "Login was successfull",
              textButton: "Ok",
              onpressed: () {
                customReplacementNavigate(context, HomePage.routeName);
              },
            ),
          );
        } else if (state is SignInErrorState) {
          buildCustomDialog(
            context,
            CustomDialog(
              icon: Icons.error,
              message: state.errorMessage,
              textButton: "try Again",
              onpressed: () {
                Navigator.pop(context);
              },
            ),
          );
        }
      },
      builder: (context, state) {
        SignInCubit signInCubit = BlocProvider.of<SignInCubit>(context);
        return Form(
          key: signInCubit.signInFormKey,
          autovalidateMode: signInCubit.signInAutoValidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                validator: Validation.validateEmail,
                onChanged: (email) {
                  signInCubit.emailAddress = email;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppStrings.password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !signInCubit.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    signInCubit.isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.greyColor,
                  ),
                  onPressed: () {
                    signInCubit.togglePasswordVisibility();
                  },
                ),
                validator: Validation.validatePassword,
                onSaved: (password) {
                  signInCubit.password = password;
                },
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
              state is SignInLoadingState
                  ? const CircularProgressIndicator(color: AppColors.primary)
                  : CustomButton(
                text: AppStrings.login,
                onPressed: () async {
                  if (signInCubit.signInFormKey.currentState!.validate()) {
                    signInCubit.signInFormKey.currentState!.save();
                    context.read<SignInCubit>().signIn(
                          email: signInCubit.emailAddress!,
                          password: signInCubit.password!,
                    );
                  } else {
                    setState(() {
                      signInCubit.signInAutoValidateMode =
                          AutovalidateMode.always;
                    });
                  }
                },
                style: AppTextStyle.circularStd500style16,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
