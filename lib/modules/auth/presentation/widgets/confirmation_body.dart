import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text.dart';
import 'confirmation_content.dart';

class ConfirmationBody extends StatelessWidget {
  const ConfirmationBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height / 10;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: height)),
          const SliverToBoxAdapter(child: CustomText(text: AppStrings.confirmation)),
          SliverToBoxAdapter(child: SizedBox(height: height)),
          const SliverToBoxAdapter(child: ConfirmationContent()),
        ],
      ),
    );
  }
}

