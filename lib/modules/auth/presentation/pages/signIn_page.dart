// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../domain/usecases/signIn.dart';
import '../../domain/usecases/social_signIn.dart';
import '../bloc/sign_in_cubit.dart';
import '../widgets/signIn_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static const String routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignInCubit(getIt<SignInUsecase>(), getIt<SocialAuthUsecase>()),
        child: const SigninBody(),
      ),
    );
  }
}
