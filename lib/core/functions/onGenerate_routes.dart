// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/modules/home/presentation/pages/home_page.dart';

import '../../modules/auth/presentation/pages/confirmation_page.dart';
import '../../modules/auth/presentation/pages/forget_password_page.dart';
import '../../modules/auth/presentation/pages/signIn_page.dart';
import '../../modules/auth/presentation/pages/signUp_page.dart';
import '../../modules/splash/bloc/splash_cubit.dart';
import '../../modules/splash/pages/splash.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SplashCubit()..appStarted(),
          child: const SplashPage(),
        ),
      );
    case SignInPage.routeName:
      return MaterialPageRoute(builder: (context) => const SignInPage());
    case SignUpPage.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpPage());
    case ForgetPasswordPage.routeName:
      return MaterialPageRoute(builder: (context) => const ForgetPasswordPage());
    case ConfirmationPage.routeName:
      return MaterialPageRoute(builder: (context) => const ConfirmationPage());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => const HomePage());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
