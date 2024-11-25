import 'package:flutter/material.dart';

import '../widgets/confirmation_body.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});
  static const routeName = 'confirmation';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ConfirmationBody(),);
  }
}