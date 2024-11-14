// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/signUp_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const String routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpBody(),
    );
  }
}
