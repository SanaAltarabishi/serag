import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/app_theme.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/widgets/details_container_stack.dart';
import 'package:serag/features/entryPages/presentation/widgets/row_options_container.dart';
import 'package:serag/features/entryPages/presentation/widgets/title_row.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.getBackgroundGradient(isDarkTheme),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                TitleRow(text: AppStrings.appTitle, isDarkTheme: isDarkTheme)
                    .animate()
                    .fadeIn(duration: 0.2.seconds, delay: .1.seconds),
                SizedBox(
                  height: context.screenHeight * 0.06,
                ),
                DetailsContainerStack(isDarkTheme: isDarkTheme)
                    .animate()
                    .fadeIn(duration: 0.3.seconds, delay: .15.seconds),
                SizedBox(
                  height: context.screenHeight * 0.04,
                ),
                RowOptionsContainer(isDarkTheme: isDarkTheme)
                    .animate()
                    .fadeIn(duration: 0.4.seconds, delay: .2.seconds),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
