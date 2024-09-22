import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/utils/build_context_extensions.dart';



class DetailsContainerStack extends StatelessWidget {
  const DetailsContainerStack({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: context.screenWidth * 0.78,
          height: context.screenHeight * 0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.containerColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(-2, 2),
              ),
            ],
          ),
        ),
        Positioned(
          right: -context.screenWidth * 0.045,
          top: -context.screenHeight * 0.05,
          child: Image.asset(
            AppImages.getGroup(isDarkTheme),
            width: context.screenWidth * 0.2,
            height: context.screenHeight * 0.1,
          ),
        ),
      ],
    );
  }
}
