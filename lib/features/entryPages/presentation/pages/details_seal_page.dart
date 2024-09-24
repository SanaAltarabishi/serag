import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/app_theme.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/core/widgets/custom_app_bar.dart';
import 'package:serag/features/entryPages/presentation/widgets/details_seal_widget/container_title.dart';
import 'package:serag/features/entryPages/presentation/widgets/details_seal_widget/sealing_part_container.dart';

class DetailsSealPage extends StatelessWidget {
  final int index;
  final String sealTitle;
  const DetailsSealPage(
      {super.key, required this.index, required this.sealTitle});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.getBackgroundGradient(isDarkTheme),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomAppBar(
                  isDarkTheme: isDarkTheme,
                  text: '${AppStrings.seal}' '${index + 1}'),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              TitleContainer(
                sealTitle: sealTitle,
                isDarkTheme: isDarkTheme,
                index: index,
              ).animate().fade(duration: 0.2.seconds, delay: 0.1.seconds),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 30,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, gridIndex) {
                    return SealingPartsContainer(
                      isDarkTheme: isDarkTheme,
                      gridIndex: gridIndex,
                    );
                  },
                ),
              ).animate().fade(duration: 0.4.seconds, delay: 0.2.seconds)
            ],
          ),
        ),
      ),
    );
  }
}
