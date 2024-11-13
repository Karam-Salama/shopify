// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../core/functions/navigation.dart';
import '../../auth/presentation/pages/signIn_page.dart';
import '../widgets/splash_body.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    delayedNavigate(SignInPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashPageBody());
  }

  void delayedNavigate(String routeName) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        customReplacementNavigate(context, routeName);
      },
    );
  }
}
