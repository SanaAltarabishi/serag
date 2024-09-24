import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class StartAndEndRow extends StatelessWidget {
  const StartAndEndRow({
    super.key,
    required this.isDarkTheme,
    required this.startTime,
    required this.endTime,
  });

  final bool isDarkTheme;
  final String startTime;
  final String endTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                AppStrings.endTime,
                style: TextStyle(
                  fontSize: context.screenWidth * 0.045,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                endTime, //from back
                style: TextStyle(
                  color: AppColors.lightTextTime,
                  fontSize: context.screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Flexible(
            child: Image.asset(
              AppImages.getFrill(isDarkTheme),
              height: context.screenHeight * 0.05,
              width: context.screenWidth * 0.11,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Text(
                AppStrings.startTime,
                style: TextStyle(
                  fontSize: context.screenWidth * 0.045,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                startTime, //from back
                style: TextStyle(
                  color: AppColors.lightTextTime,
                  fontSize: context.screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
