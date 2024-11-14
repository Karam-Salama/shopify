import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'custom_checkbox_widget.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomCheckBox(),
          Flexible(
            child: Text.rich(
              TextSpan(
                text: AppStrings.acceptTerms,
                style: AppTextStyle.circularStd700style13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
