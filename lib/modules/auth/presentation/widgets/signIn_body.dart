// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text.dart';
import '../pages/signUp_page.dart';
import '../../../../core/widgets/custom_have_account.dart';
import 'or_divider.dart';
import 'social_Buttons.dart';
import 'signIn_form.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 60)),
          const SliverToBoxAdapter(child: CustomText(text: AppStrings.login)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: SignInForm()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: HaveAccountWidget(
              textPart1: AppStrings.dontHaveAccount,
              textPart2: AppStrings.createAccount,
              onPress: () {
                customReplacementNavigate(context, SignUpPage.routeName);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(child: CustomOrDivider(text: AppStrings.or)),
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
          const SliverToBoxAdapter(child: CustomSocialButtons()),
          const SliverToBoxAdapter(child: SizedBox(height: 66)),
        ],
      ),
    );
  }
}
