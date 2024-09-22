import 'package:flutter/material.dart';
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
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          sealTitle,
                          style: TextStyle(
                            color: isDarkTheme
                                ? AppColors.darkTitle
                                : AppColors.lightTitle,
                            fontSize: context.screenWidth * 0.065, //25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
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
                      top: context.screenHeight * 0.03, //20,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: AppColors.containerColor,
                          fontWeight: FontWeight.w400,
                          fontSize: context.screenWidth * 0.04, //17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 30,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, gridindex) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          '${gridindex + 1}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: isDarkTheme
                                  ? AppColors.darkTitle
                                  : AppColors.lightTitle),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
