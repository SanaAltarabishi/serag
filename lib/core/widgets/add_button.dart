import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.screenWidth * 0.68, //300,
        height: context.screenHeight * 0.06, //45,
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            AppStrings.add,
            style: TextStyle(
              color: isDarkTheme
                  ? AppColors.darkDialog
                  : AppColors.lightGradientEnd,
              fontSize: context.screenWidth * 0.06, //25,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
