import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/widgets/title_row.dart';

class CustomAppBar extends StatelessWidget {
  final bool isDarkTheme;
  final String text;
  const CustomAppBar({super.key, required this.isDarkTheme, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color:
                isDarkTheme ? AppColors.darkArrow : AppColors.lightGradientEnd,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.18,
        ),
        TitleRow(
          text: text,
          isDarkTheme: isDarkTheme,
        )
      ],
    );
  }
}
