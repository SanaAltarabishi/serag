import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/app_theme.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/widgets/seal_page_widgets/card_seals.dart';
import 'package:serag/features/entryPages/presentation/widgets/seal_page_widgets/custom_floating_action_button.dart';
import 'package:serag/core/widgets/custom_app_bar.dart';
import 'package:serag/features/entryPages/presentation/widgets/seal_page_widgets/seal_form_container.dart';

class SealPage extends StatefulWidget {
  const SealPage({super.key});

  @override
  State<SealPage> createState() => _SealPageState();
}

class _SealPageState extends State<SealPage> {
  bool _isContainerVisible = false;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.getBackgroundGradient(isDarkTheme),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  CustomAppBar(
                    isDarkTheme: isDarkTheme,
                    text: AppStrings.seals,
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CardSeals(
                          index: index,
                          isDarkTheme: isDarkTheme,
                        ).animate().scaleXY(
                            duration: (0.3 * index).seconds,
                            delay: (0.1 * index).seconds);
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.05,
                  )
                ],
              ),
              if (_isContainerVisible)
                ModalBarrier(
                  dismissible: true,
                  color: isDarkTheme
                      ? AppColors.darkGradientStart.withOpacity(0.3)
                      : AppColors.lightGradientEnd.withOpacity(0.3),
                  onDismiss: () {
                    setState(
                      () {
                        _isContainerVisible = false;
                      },
                    );
                  },
                ),
              if (_isContainerVisible)
                _buildAnimatedContainer(context, isDarkTheme),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _isContainerVisible
          ? null
          : CustomFloatingActionButton(
              onPressed: () {
                setState(
                  () {
                    _isContainerVisible = true;
                  },
                );
              },
              isDarkTheme: isDarkTheme,
            ),
    );
  }

  AnimatedPositioned _buildAnimatedContainer(
      BuildContext context, bool isDarkTheme) {
    return AnimatedPositioned(
      duration: const Duration(
        milliseconds: 700,
      ),
      curve: Curves.easeInOut,
      left: 0,
      right: 0,
      top: _isContainerVisible
          ? context.screenHeight * 0.4
          : context.screenHeight,
      child: SealFormContainer(
        isDarkTheme: isDarkTheme,
      ),
    );
  }
}
