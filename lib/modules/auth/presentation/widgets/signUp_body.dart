// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopify/modules/auth/presentation/pages/signIn_page.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_have_account.dart';
import '../../../../core/widgets/custom_text.dart';
import 'signUp_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 60)),
          const SliverToBoxAdapter(child: CustomText(text: AppStrings.register)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: SignUpForm()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: HaveAccountWidget(
              textPart1: AppStrings.alreadyHaveAccount,
              textPart2: AppStrings.login,
              onPress: () { customReplacementNavigate(context, SignInPage.routeName); },
            ),
          ),
        ],
      ),
    );
  }
}
