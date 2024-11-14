// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      side: const BorderSide(color: AppColors.greyColor, width: 1.0),
      onChanged: (newValue) {
        setState(() {
          value = newValue!;
        });
      },
    );
  }
}
