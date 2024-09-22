import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/widgets/seal_page_widgets/seal_form_container.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.widget,
  });

  final SealFormContainer widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: context.screenWidth * 0.33, //125,
            height: context.screenHeight * 0.04, //30,
            decoration: BoxDecoration(
              color: widget.isDarkTheme
                  ? AppColors.darkShareContainer
                  : AppColors.lightShareContainer,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              // mainAxisAlignment:
              //     MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.share,
                  color: AppColors.whiteColor,
                  size: context.screenWidth * 0.05, //20,
                ),
                SizedBox(
                  width: context.screenWidth * 0.05,
                ),
                Text(
                  AppStrings.share,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: context.screenWidth * 0.04, // 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.2,
                    decorationColor: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -5,
            top: -8,
            child: Icon(Icons.auto_awesome,
                color: const Color.fromARGB(255, 213, 155, 68),
                size: context.screenWidth * 0.06 //25,
                ),
          ),
        ],
      ),
    );
  }
}
