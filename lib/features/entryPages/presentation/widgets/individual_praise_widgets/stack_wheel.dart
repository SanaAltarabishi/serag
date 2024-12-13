import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/widgets/individual_praise_widgets/circle_painter.dart';

class StackWheel extends StatelessWidget {
  final List<int> indexList;
  final double scrollPosition;
  final int remaining;
  final Function(DragStartDetails) onVerticalDragStart;
  final Function(DragStartDetails) onHorizontalDragStart;
  final ValueListenable<bool> valueListenable;
  final void Function() onTap;
  final bool isDarkTheme;
  const StackWheel(
      {super.key,
      required this.indexList,
      required this.scrollPosition,
      required this.remaining,
      required this.valueListenable,
      required this.onVerticalDragStart,
      required this.onHorizontalDragStart,
      required this.onTap,
      required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: LayoutBuilder(
            builder: (context, constraints) {
              const maxContainerSize = 400.0;
              final containerSize =
                  constraints.maxWidth * 0.92 > maxContainerSize
                      ? maxContainerSize
                      : constraints.maxWidth * 0.92;
              final imageSize = containerSize * 0.72;
              final iconSize = containerSize * 0.18;
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onVerticalDragStart: onVerticalDragStart,
                    onHorizontalDragStart: onHorizontalDragStart,
                    child: Container(
                      width:
                          containerSize, //context.screenHeight * 0.45, //357,
                      height: containerSize, //context.screenHeight * 0.45,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: AppColors.containerColor,
                        shape: BoxShape.circle,
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: valueListenable,
                        builder: (context, started, child) {
                          return CustomPaint(
                            painter: CirclePainter(
                              containerCount: indexList.length,
                              containerColor: Colors.transparent,
                              containerRadius: containerSize *
                                  0.2, //context.screenHeight * 0.09,
                              containerTextSize: containerSize *
                                  0.05, // context.screenWidth * 0.04,
                              scrollPosition: scrollPosition,
                              circleSize:
                                  containerSize, //context.screenHeight * 0.45,
                            ),
                          )
                              .animate(
                                target: started ? 1 : 0,
                                onPlay: (controller) => controller.reverse(),
                                onComplete: (controller) =>
                                    debugPrint('complet'),
                              )
                              .shake(hz: 3);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: imageSize, //context.screenHeight * 0.35, //294,
                      height: imageSize, // context.screenHeight * 0.35, //284,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 216, 194, 169),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: context.screenHeight * 0.3, //212
                          height: context.screenHeight * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AppImages.mandala,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: iconSize, //context.screenHeight * 0.09, //63,
                      height: iconSize, //context.screenHeight * 0.09, //63,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(-2, -2),
                          ),
                        ],
                        color: AppColors.containerColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: (remaining == 0)
                            ? Icon(
                                Icons.rotate_left_rounded,
                                color: AppColors.blackColor,
                                size: iconSize * 0.35,
                              )
                            : Text(
                                AppStrings.tap,
                                style: TextStyle(
                                  fontSize: iconSize *
                                      0.35, //context.screenWidth * 0.04,
                                  color: AppColors.blackColor,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -iconSize / 2.4, //-context.screenHeight * 0.02,
                    child: Icon(Icons.arrow_drop_down,
                        size: iconSize, //context.screenWidth * 0.08,
                        color: isDarkTheme
                            ? AppColors.darkDialog
                            : AppColors
                                .lightGradientEnd // AppColors.blackColor,
                        ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
