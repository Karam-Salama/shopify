import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: AppTextStyle.circularStd26Boldstyle,
    );
  }
}
