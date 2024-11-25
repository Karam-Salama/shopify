import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 60)),
          SliverToBoxAdapter(child: CustomText(text: AppStrings.appName)),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
