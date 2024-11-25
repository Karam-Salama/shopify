import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/usecases/reset_pass.dart';
import '../bloc/reset_pass_cubit.dart';
import '../widgets/forget_password_body.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static const String routeName = ' ForgetPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ResetPassCubit(getIt<ResetPassUsecase>()),
        child: const ForgetPasswordBody(),
      ),
    );
  }
}
