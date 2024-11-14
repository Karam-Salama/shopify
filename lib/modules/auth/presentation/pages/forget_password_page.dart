import 'package:flutter/material.dart';

import '../widgets/forget_password_body.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static const String routeName = ' ForgetPassword';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ForgetPasswordBody());
  }
}
