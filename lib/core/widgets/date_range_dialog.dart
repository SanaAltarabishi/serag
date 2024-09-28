
import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class DateRangeDialog extends StatelessWidget {
  final bool isDarkTheme;
  final Widget child;
  const DateRangeDialog({
    super.key,
    required this.isDarkTheme,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: context.screenWidth * 0.8, // 300,
            maxHeight: context.screenHeight * 0.7 //530,
            ),
        child: Theme(
          data: ThemeData(
            colorScheme: isDarkTheme
                ? ColorScheme.dark(
                    primary: AppColors.darkGradientStart,
                    onPrimary: AppColors.whiteColor,
                    surface: AppColors.whiteColor,
                    onSurface: Colors.black,
                    secondary: AppColors.darkGradientStart.withOpacity(0.2),
                  )
                : ColorScheme.light(
                    primary: AppColors.lightGradientEnd,
                    onPrimary: AppColors.whiteColor,
                    surface: AppColors.whiteColor,
                    onSurface: Colors.black,
                    secondary: AppColors.lightGradientEnd.withOpacity(0.2),
                  ),
          ),
          child: child,
        ),
      ),
    );
  }
}
