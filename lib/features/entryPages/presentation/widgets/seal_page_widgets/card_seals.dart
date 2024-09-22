import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class CardSeals extends StatelessWidget {
  final bool isDarkTheme;
  final int index;
  const CardSeals({
    super.key,
    required this.isDarkTheme,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.screenHeight * 0.02,
        horizontal: context.screenWidth * 0.04,
      ),
      // width: 309,
      // height: 195,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(-2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.screenWidth * 0.01,
                ),
                Text(
                  'ختمة بنية الشفاء ', //data cames form back !
                  style: TextStyle(
                      fontSize: context.screenWidth * 0.06,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        AppImages.getGroup(isDarkTheme),
                        height: context.screenHeight * 0.1,
                        width: context.screenWidth * 0.25,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        (index + 1).toString(),
                        style: const TextStyle(color: AppColors.containerColor),
                      ) //from back of the index ?
                    ],
                  ),
                ),
              ],
            ).animate().fade(duration: 0.3.seconds,delay: 0.1.seconds),
            Divider(
              endIndent: 10,
              indent: 10,
              color: isDarkTheme
                  ? AppColors.darkDialog.withOpacity(0.5)
                  : AppColors.lightGradientEnd.withOpacity(0.5),
            ).animate().fade(duration: 0.5.seconds,delay: 0.2.seconds),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
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
                        '3/4/2024', //from back
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
                        '3/3/2024', //from back
                        style: TextStyle(
                          color: AppColors.lightTextTime,
                          fontSize: context.screenWidth * 0.035,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ],
              ).animate().fade(duration: 0.7.seconds,delay: 0.3.seconds),
            )
          ],
        ),
      ),
    );
  }
}