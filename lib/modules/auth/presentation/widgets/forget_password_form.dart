import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/functions/navigation.dart';

import '../../../../core/functions/build_custom_dialog.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import '../../../../core/widgets/cutom_text_form_field.dart';
import '../bloc/reset_pass_cubit.dart';
import '../bloc/reset_pass_state.dart';
import '../pages/confirmation_page.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPassCubit, ResetPassState>(
        listener: (context, state) {
      if (state is ResetPassSuccessState) {
        buildCustomDialog(
          context,
          CustomDialog(
            icon: Icons.check_circle,
            message: "Email sent successfully",
            textButton: "Ok",
            onpressed: () {
              customReplacementNavigate(context, ConfirmationPage.routeName);
            },
          ),
        );
      } else if (state is ResetPassErrorState) {
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
      ResetPassCubit resetPassCubit = BlocProvider.of<ResetPassCubit>(context);
      return Form(
        key: resetPassCubit.resetPassFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
              validator: Validation.validateEmail,
              onChanged: (email) {
                resetPassCubit.emailAddress = email;
              },
            ),
            const SizedBox(height: 50),
            state is ResetPassLoadingState
                ? const CircularProgressIndicator(color: AppColors.primary)
                : CustomButton(
                    text: AppStrings.forgottingPassword,
                    onPressed: () {
                      if (resetPassCubit.resetPassFormKey.currentState!
                          .validate()) {
                        resetPassCubit.resetPassFormKey.currentState!.save();
                        context
                            .read<ResetPassCubit>()
                            .resetPass(params: resetPassCubit.emailAddress);
                      } else {
                        setState(() {
                          resetPassCubit.resetPassAutoValidateMode =
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
    });
  }
}
