// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/modules/auth/domain/usecases/signUp.dart';

import '../../../../core/services/service_locator.dart';
import '../bloc/sign_up_cubit.dart';
import '../widgets/signUp_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const String routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt<SignupUsecase>()),
        child: const SignUpBody(),
      ),
    );
  }
}
