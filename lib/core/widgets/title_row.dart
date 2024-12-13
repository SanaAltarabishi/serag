import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/fonts.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class TitleRow extends StatelessWidget {
  final String text;
  const TitleRow({
    super.key,
    required this.isDarkTheme, required this.text,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: context.screenWidth*0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
            transform: Matrix4.rotationY(185),
            child: Image.asset(
              AppImages.getFloral(isDarkTheme),
              width: context.screenWidth * 0.07,
              height: context.screenHeight * 0.07,
            ),
          ),
          Text(
           text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily:  AppFonts.getFontFamily(),
                fontWeight: FontWeight.w400,
                fontSize: context.screenWidth * 0.06,
                color: isDarkTheme ? AppColors.darkTitle : AppColors.lightTitle),
          ),
          SizedBox(
            width: context.screenWidth * 0.05,
          ),
          Image.asset(
            AppImages.getFloral(isDarkTheme),
            width: context.screenWidth * 0.07,
            height: context.screenHeight * 0.07,
          ),
        ],
      ),
    );
  }
}
