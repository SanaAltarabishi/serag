import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class TargetContainer extends StatelessWidget {
  final bool isDarkTheme;
  final int topIndexCont;
  const TargetContainer(
      {super.key, required this.isDarkTheme, required this.topIndexCont});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: context.screenWidth * 0.38, //150,
            height: context.screenHeight * 0.042, //35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.containerColor,
            ),
            child: Center(
              child: Text(
                'target :$topIndexCont',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            right: -10,
            top: -8,
            child: Image.asset(AppImages.getGroup(isDarkTheme),
                width: context.screenWidth * 0.12, //50,
                height: context.screenHeight * 0.062 //50,
                ),
          ),
          Positioned(
            right: 5,
            top: 10,
            child: Text(
              'الهدف',
              style: TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w400,
                color: AppColors.containerColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
