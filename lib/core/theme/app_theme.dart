import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightGradientEnd,
    //hoverColor: AppColors.lightGradientMiddle1,
  );
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkDialog,
     // hoverColor: AppColors.darkGradientMiddle4
     );

  static LinearGradient getBackgroundGradient(bool isDarkTheme) {
    if (isDarkTheme) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.darkGradientStart,
          AppColors.darkGradientMiddle1,
          AppColors.darkGradientMiddle2,
          AppColors.darkGradientMiddle3,
          AppColors.darkGradientMiddle4,
          AppColors.darkGradientMiddle5,
          AppColors.darkGradientEnd,
        ],
        stops: [0.0449, 0.179, 0.399, 0.604, 0.734, 0.8144, 0.939],
      );
    } else {
      return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.lightGradientStart1,
            AppColors.lightGradientStart1,
            AppColors.lightGradientMiddle1,
            AppColors.lightGradientMiddle2,
            AppColors.lightGradientMiddle3,
            AppColors.lightGradientEnd,
          ],
          stops: [
            0.0,
            0.0,
            0.204,
            0.3767,
            0.7167,
            1.0
          ]);
    }
  }
}
