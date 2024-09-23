
import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class PraiseDialog extends StatelessWidget {
  const PraiseDialog({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(5),
        width: context.screenWidth, //280,
        height: context.screenHeight * 0.2, //120,
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: context.screenWidth * 0.22,
              height: context.screenHeight * 0.065,
              decoration: BoxDecoration(
                color: isDarkTheme
                    ? AppColors.darkDialog
                    : AppColors.lightTitle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.individualPraise,
                    style: TextStyle(
                      fontSize:
                          context.screenWidth * 0.04, //20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.containerColor,
                    ),
                  ),
                  Flexible(
                      child: Image.asset(AppImages.counter)),
                ],
              ),
            ),
            Container(
              width: context.screenWidth * 0.22,
              height: context.screenHeight * 0.065,
              decoration: BoxDecoration(
                color: isDarkTheme
                    ? AppColors.darkDialog
                    : AppColors.lightTitle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.praiseSession,
                    style: TextStyle(
                      fontSize:
                          context.screenWidth * 0.04, //20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.containerColor,
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      AppImages.meeting,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
