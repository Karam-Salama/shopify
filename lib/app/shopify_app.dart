import 'package:flutter/material.dart';

import '../core/functions/onGenerate_routes.dart';
import '../core/utils/app_theme.dart';
import '../modules/splash/pages/splash.dart';

class Shopify extends StatelessWidget {
  const Shopify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashPage.routeName,
    );
  }
}