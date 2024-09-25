import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/core/widgets/start_end_row.dart';
import 'package:serag/features/entryPages/models/praiseSession_model.dart';
import 'package:serag/features/entryPages/presentation/widgets/praise_session/residual_required_row.dart';

class PraiseCard extends StatelessWidget {
  const PraiseCard({
    super.key,
    required this.isDarkTheme,
    required this.praise,
    required this.index,
  });

  final bool isDarkTheme;
  final int index;
  final List<PraiseSessionModel> praise;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(
        vertical: context.screenHeight * 0.02,
          horizontal: context.screenWidth * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.containerColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.info_outline,
                color: isDarkTheme
                    ? AppColors.darkDialog
                    : AppColors.lightGradientEnd,
              ),
              Text(
                praise[index].title,
                style: TextStyle(
                  color: isDarkTheme
                      ? AppColors.darkDialog
                      : AppColors.lightGradientEnd,
                  fontWeight: FontWeight.w400,
                  fontSize: context.screenWidth * 0.07, // 25,
                ),
              ),
              Stack(
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
                    '${index + 1}',
                    style: const TextStyle(color: AppColors.containerColor),
                  ),
                ],
              ),
            ],
          ).animate().fade(delay: 0.1.seconds, duration: 0.2.seconds),
          Divider(
            color:
                isDarkTheme ? AppColors.darkDialog : AppColors.lightGradientEnd,
            endIndent: 15,
            indent: 15,
          ).animate().fade(delay: 0.15.seconds, duration: 0.4.seconds),
          StartAndEndRow(
            isDarkTheme: isDarkTheme,
            startTime: praise[index].startTime,
            endTime: praise[index].endTime,
          ).animate().fade(delay: 0.2.seconds, duration: 0.6.seconds),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          ResidualAndRequiredRow(
            residualText: praise[index].residual.toString(),
            requiredText: praise[index].required.toString(),
          ).animate().fade(delay: 0.25.seconds, duration: 0.8.seconds),
        ],
      ),
    );
  }
}
