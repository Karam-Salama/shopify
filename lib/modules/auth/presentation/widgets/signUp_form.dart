// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/modules/auth/presentation/pages/signIn_page.dart';
import '../../../../core/functions/build_custom_dialog.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import '../../../../core/widgets/custom_terms_and_conds_widget.dart';
import '../../../../core/widgets/cutom_text_form_field.dart';
import '../bloc/sign_up_cubit.dart';
import '../bloc/sign_up_state.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (BuildContext context, state) {
        if (state is SignUpSuccessState) {
          buildCustomDialog(
            context,
            CustomDialog(
              icon: Icons.check_circle,
              message: "Account created successfully",
              textButton: "Ok",
              onpressed: () {
                customReplacementNavigate(context, SignInPage.routeName);
              },
            ),
          );
        } else if (state is SignUpErrorState) {
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
      builder: (BuildContext context, state) {
        SignUpCubit signUpCubit = BlocProvider.of<SignUpCubit>(context);
        return Form(
          key: signUpCubit.signUpFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: AppStrings.firstName,
                    keyboardType: TextInputType.name,
                    validator: Validation.validateName,
                    onSaved: (firstName) {
                      signUpCubit.firstName = firstName;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    hintText: AppStrings.lastName,
                    keyboardType: TextInputType.name,
                    validator: Validation.validateName,
                    onSaved: (lastName) {
                      signUpCubit.lastName = lastName;
                    },
                  ),
                ),
              ]),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                validator: Validation.validateEmail,
                onSaved: (email) {
                  signUpCubit.emailAddress = email;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppStrings.password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !signUpCubit.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    signUpCubit.isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.greyColor,
                  ),
                  onPressed: () {
                    signUpCubit.togglePasswordVisibility();
                  },
                ),
                validator: Validation.validatePassword,
                onSaved: (password) {
                  signUpCubit.password = password;
                },
              ),
              const SizedBox(height: 8),
              const TermsAndConditionsWidget(),
              const SizedBox(height: 30),
              state is SignUpLoadingState
                  ? const CircularProgressIndicator(color: AppColors.primary)
                  : CustomButton(
                      text: AppStrings.createAccount,
                      style: AppTextStyle.circularStd500style16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      backGroundColor: signUpCubit.isTermsAndConditionsAccepted!
                          ? null
                          : AppColors.lightGreyColor,
                      onPressed: () async {
                        if (signUpCubit.isTermsAndConditionsAccepted!) {
                          if (signUpCubit.signUpFormKey.currentState!
                              .validate()) {
                            signUpCubit.signUpFormKey.currentState!.save();
                            context
                                .read<SignUpCubit>()
                                .createUserWithEmailAndPassword(
                                  signUpCubit.emailAddress!,
                                  signUpCubit.password!,
                                  signUpCubit.firstName!,
                                  signUpCubit.lastName!,
                                );
                          } else {
                            setState(() {
                              signUpCubit.signUpAutoValidateMode =
                                  AutovalidateMode.always;
                            });
                          }
                        } else {
                          buildCustomDialog(
                            context,
                            CustomDialog(
                              icon: Icons.warning_amber_rounded,
                              message: "please accept terms and conditions",
                              textButton: "ok",
                              onpressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
