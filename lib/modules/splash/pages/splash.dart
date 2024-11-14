// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/functions/navigation.dart';
import 'package:shopify/modules/auth/presentation/pages/signIn_page.dart';
import 'package:shopify/modules/splash/bloc/splash_cubit.dart';
import 'package:shopify/modules/splash/bloc/splash_state.dart';
import '../widgets/splash_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if(state is UnAuthenticated){
          customReplacementNavigate(context, SignInPage.routeName);
        }
      },
      child: const Scaffold(body: SplashPageBody()),
    );
  }
}
