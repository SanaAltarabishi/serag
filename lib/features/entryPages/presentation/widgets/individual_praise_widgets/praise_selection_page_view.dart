import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class PraiseSelectionPageView extends StatelessWidget {
  final bool isDarkTheme;
  final List<String> praises;
  final int currentPageIndex;
  final ValueChanged<int> onPageChanged;
  const PraiseSelectionPageView(
      {super.key,
      required this.isDarkTheme,
      required this.praises,
      required this.currentPageIndex,
      required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.25, //170,
      child: PageView.builder(
        controller: PageController(
          initialPage: currentPageIndex,
          viewportFraction: 0.8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: praises.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          double scale = (currentPageIndex == index) ? 1 : 0.9;
          Color containerColor = (currentPageIndex == index)
              ? (isDarkTheme
                  ? AppColors.darkDialog
                  : AppColors.lightGradientEnd)
              : (isDarkTheme
                  ? AppColors.darkDialog.withOpacity(0.7)
                  : AppColors.lightShareContainer);
          return Transform.scale(
            scale: scale,
            child: Container(
              width: context.screenWidth * 0.8, //330, // width: 280,
              height: context.screenHeight * 0.25, //170,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(
                  praises[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: context.screenWidth * 0.08, //30,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
