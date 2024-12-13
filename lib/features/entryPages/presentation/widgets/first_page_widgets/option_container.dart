import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/fonts.dart';
import 'package:serag/core/utils/build_context_extensions.dart';


class OptionContainer extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final String image;
  final bool isDarkTheme;
  const OptionContainer({
    super.key,
    required this.onTap,
    required this.text,
    required this.image,
    required this.isDarkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.screenWidth * 0.25,
        height: context.screenHeight * 0.12,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.containerColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                image,
                width: context.screenWidth * 0.12,
                height: context.screenHeight * 0.06,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily:  AppFonts.getFontFamily(),
                fontSize: context.screenWidth * 0.03,
                color: isDarkTheme
                    ? AppColors.darkDialog
                    : AppColors.lightGradientEnd,
              ),
            )
          ],
        ).animate().fadeIn(duration: 0.6.seconds, delay: .3.seconds),
      ),
    );
  }
}