import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/app_theme.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/core/widgets/custom_app_bar.dart';
import 'package:serag/features/entryPages/models/praiseSession_model.dart';
import 'package:serag/features/entryPages/presentation/widgets/praise_session/praise_card.dart';
import 'package:serag/features/entryPages/presentation/widgets/praise_session/praise_form_container.dart';
import 'package:serag/features/entryPages/presentation/widgets/seal_page_widgets/custom_floating_action_button.dart';

class PraiseSessionPage extends StatefulWidget {
  const PraiseSessionPage({super.key});

  @override
  State<PraiseSessionPage> createState() => _PraiseSessionPageState();
}

class _PraiseSessionPageState extends State<PraiseSessionPage> {
  bool _isContainerVisible = false;

  @override
  Widget build(BuildContext context) {
    List<PraiseSessionModel> praise = [
      PraiseSessionModel(
        title: 'صلاة عالنبي ',
        startTime: '15/1/2020',
        endTime: '19/1/2020',
        required: 10000,
        residual: 200,
      ),
      PraiseSessionModel(
        title: 'استغفار',
        startTime: '15/1/2020',
        endTime: '19/1/2020',
        required: 10000,
        residual: 200,
      ),
      PraiseSessionModel(
        title: 'حوقلة',
        startTime: '15/1/2020',
        endTime: '21/1/2020',
        required: 10000,
        residual: 200,
      ),
      PraiseSessionModel(
        title: 'استغفار',
        startTime: '15/1/2020',
        endTime: '19/1/2020',
        required: 10000,
        residual: 200,
      ),
      PraiseSessionModel(
        title: 'استغفار',
        startTime: '15/1/2020',
        endTime: '30/1/2020',
        required: 10000,
        residual: 200,
      ),
    ];

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
                    text: AppStrings.praiseSession,
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: praise.length,
                      itemBuilder: (context, index) {
                        return PraiseCard(
                          isDarkTheme: isDarkTheme,
                          index: index,
                          praise: praise,
                        ).animate().scaleXY(
                              duration: (0.12 * index).seconds,
                              delay: (0.01 * index).seconds,
                            );
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
                    setState(() {
                      _isContainerVisible = false;
                    });
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
      child: PraiseFormContainer(
        isDarkTheme: isDarkTheme,
      ),
    );
  }
}
