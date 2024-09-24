import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class PraiseFormContainer extends StatelessWidget {
  final bool isDarkTheme;
  const PraiseFormContainer({super.key, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: context.screenHeight,
      decoration: BoxDecoration(
          color:
              isDarkTheme ? AppColors.darkDialog : AppColors.lightGradientEnd,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
    );
  }
}
