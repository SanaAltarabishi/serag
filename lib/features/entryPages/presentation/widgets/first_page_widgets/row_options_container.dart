import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/seal_page.dart';
import 'package:serag/features/entryPages/presentation/widgets/first_page_widgets/praise_dialog.dart';
import 'package:serag/features/entryPages/presentation/widgets/option_container.dart';

class RowOptionsContainer extends StatelessWidget {
  const RowOptionsContainer({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.95,
      height: context.screenHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDarkTheme ? AppColors.darkDialog : AppColors.lightGradientEnd,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OptionContainer(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return PraiseDialog(isDarkTheme: isDarkTheme);
                  },
                );
              },
              text: AppStrings.praise,
              image: AppImages.beads,
              isDarkTheme: isDarkTheme,
            ),
            OptionContainer(
              onTap: () {},
              image: AppImages.quran,
              text: AppStrings.surah,
              isDarkTheme: isDarkTheme,
            ),
            OptionContainer(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const SealPage(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
              image: AppImages.series,
              text: AppStrings.seal,
              isDarkTheme: isDarkTheme,
            ),
          ],
        ).animate().fadeIn(duration: 0.5.seconds, delay: .25.seconds),
      ),
    );
  }
}
