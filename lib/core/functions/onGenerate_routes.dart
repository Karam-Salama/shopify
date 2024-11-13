// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopify/modules/home/presentation/pages/home_page.dart';

import '../../modules/auth/presentation/pages/signIn_page.dart';
import '../../modules/splash/pages/splash.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(builder: (context) => const SplashPage());
    case SignInPage.routeName:
      return MaterialPageRoute(builder: (context) => const SignInPage());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => const HomePage());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}