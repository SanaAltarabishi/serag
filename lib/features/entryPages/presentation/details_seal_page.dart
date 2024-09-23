import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/app_theme.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/widgets/custom_app_bar.dart';

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
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: context.screenWidth * 0.8, // 310,
                      height: context.screenHeight * 0.095, //65,
                      decoration: BoxDecoration(
                        color: AppColors.titleContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          sealTitle,
                          style: TextStyle(
                            color: isDarkTheme
                                ? AppColors.darkDialog
                                : AppColors.lightTitle,
                            fontSize: context.screenHeight * 0.035, //25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                          .animate()
                          .fade(duration: 0.2.seconds, delay: 0.15.seconds),
                    ),
                    Positioned(
                      right: -context.screenWidth * 0.08,
                      top: -context.screenHeight * 0.02, //-15,
                      child: Image.asset(
                        AppImages.getGroup(isDarkTheme),
                        width: context.screenWidth * 0.22,
                        height: context.screenHeight * 0.136,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      right: context.screenWidth * 0.02, //8,
                      top: context.screenHeight * 0.025, //20,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: AppColors.containerColor,
                          fontWeight: FontWeight.w400,
                          fontSize: context.screenHeight * 0.025, //17,
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fade(duration: 0.2.seconds, delay: 0.1.seconds),
              SizedBox(
                height: context.screenHeight * 0.04,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 30,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, gridindex) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isDarkTheme
                            ? AppColors.darkContainer
                            : AppColors.containerColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            offset: Offset(-5, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${gridindex + 1}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: isDarkTheme
                                ? AppColors.darkDialog
                                : AppColors.lightTitle,
                          ),
                        ),
                      ),
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
