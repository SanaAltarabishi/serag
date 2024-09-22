import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomFloatingActionButton({
    super.key,
    required this.isDarkTheme, required this.onPressed,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: AppColors.containerColor.withOpacity(0.3),
          blurRadius: 5,
        //  offset: const Offset(-3, 4),
        ),
      ]),
      child: FloatingActionButton(
        elevation: 2,
        backgroundColor:
            isDarkTheme ? AppColors.darkDialog : AppColors.lightGradientEnd,
        onPressed: onPressed,
        child: Center(
          child: Icon(
            Icons.add,
            color: AppColors.containerColor,
            size: context.screenWidth * 0.08,
          ),
        ),
      ),
    );
  }
}
