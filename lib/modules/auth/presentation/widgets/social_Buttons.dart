// ignore_for_file: must_be_immutable, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/utils/app_colors.dart';
import 'package:shopify/modules/auth/presentation/bloc/sign_in_cubit.dart';
import 'package:shopify/modules/home/presentation/pages/home_page.dart';
import '../../../../core/functions/build_custom_dialog.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/app_vectors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';

class CustomSocialButtons extends StatelessWidget {
  const CustomSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(listener: (context, state) {
      if (state is SignInSocialSuccessState) {
        buildCustomDialog(
          context,
          CustomDialog(
            icon: Icons.check_circle,
            message: "Login successfully",
            textButton: "Ok",
            onpressed: () {
              customReplacementNavigate(context, HomePage.routeName);
            },
          ),
        );
      } else if (state is SignInSocialErrorState) {
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
    }, builder: (context, state) {
      SignInCubit signInsocialCubit = BlocProvider.of<SignInCubit>(context);
      return Column(
        children: [
          CustomButton(
            imageIcon: AppVectors.google,
            text: AppStrings.google,
            backGroundColor: AppColors.lightBackground,
            borderColor: const Color(0xFFDDDFDF),
            onPressed: () {
              signInsocialCubit.signInWithGoogle();
            },
            style: AppTextStyle.circularStd600style16,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          const SizedBox(height: 16),
          Platform.isIOS
              ? Column(
                  children: [
                    state is SignInSocialLoadingState
                        ? CustomButton(
                            imageIcon: AppVectors.apple,
                            text: AppStrings.apple,
                            backGroundColor: AppColors.lightBackground,
                            borderColor: const Color(0xFFDDDFDF),
                            onPressed: () {
                              // signInsocialCubit.signInWithApple();
                            },
                            style: AppTextStyle.circularStd600style16,
                            mainAxisAlignment: MainAxisAlignment.start,
                          )
                        : const CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                    const SizedBox(height: 16),
                  ],
                )
              : const SizedBox(),
          CustomButton(
            imageIcon: AppVectors.facebook,
            text: AppStrings.facebook,
            backGroundColor: AppColors.lightBackground,
            borderColor: const Color(0xFFDDDFDF),
            onPressed: () {
              signInsocialCubit.signInWithFacebook();
            },
            style: AppTextStyle.circularStd600style16,
            mainAxisAlignment: MainAxisAlignment.start,
          )
        ],
      );
    });
  }
}
