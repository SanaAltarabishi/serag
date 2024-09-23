import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/utils/build_context_extensions.dart';


class TitleContainer extends StatelessWidget {
  const TitleContainer({
    super.key,
    required this.sealTitle,
    required this.isDarkTheme,
    required this.index,
  });

  final String sealTitle;
  final bool isDarkTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: context.screenWidth * 0.8, // 310,
            height: context.screenHeight * 0.095, //65,
            decoration: BoxDecoration(
              color: AppColors.titleContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                sealTitle,
                style: TextStyle(
                  color: isDarkTheme
                      ? AppColors.darkDialog
                      : AppColors.lightTitle,
                  fontSize: context.screenHeight * 0.035, //25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
                .animate()
                .fade(duration: 0.2.seconds, delay: 0.15.seconds),
          ),
          Positioned(
            right: -context.screenWidth * 0.08,
            top: -context.screenHeight * 0.02, //-15,
            child: Image.asset(
              AppImages.getGroup(isDarkTheme),
              width: context.screenWidth * 0.22,
              height: context.screenHeight * 0.136,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: context.screenWidth * 0.02, //8,
            top: context.screenHeight * 0.025, //20,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: AppColors.containerColor,
                fontWeight: FontWeight.w400,
                fontSize: context.screenHeight * 0.025, //17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
