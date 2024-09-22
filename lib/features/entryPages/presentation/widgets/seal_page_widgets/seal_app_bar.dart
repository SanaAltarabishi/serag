
import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/widgets/title_row.dart';

class SealAppBar extends StatelessWidget {
  const SealAppBar({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDarkTheme
                ? AppColors.darkArrow
                : AppColors.lightGradientEnd,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.18,
        ),
        TitleRow(
          text: AppStrings.seals,
          isDarkTheme: isDarkTheme,
        )
      ],
    );
  }
}
