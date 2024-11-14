// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/signIn_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static const String routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SigninBody());
  }
}
