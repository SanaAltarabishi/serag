import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class SelectedPraiseContainer extends StatelessWidget {
  final bool isDarkTheme;
  final String selectedPraise;
  const SelectedPraiseContainer(
      {super.key, required this.isDarkTheme, required this.selectedPraise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: context.screenWidth * 0.8, //330,
      height: context.screenHeight * 0.25, //170,
      decoration: BoxDecoration(
        color: isDarkTheme ? AppColors.darkDialog : AppColors.lightGradientEnd,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Text(
          selectedPraise,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.screenWidth * 0.08, //30,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
