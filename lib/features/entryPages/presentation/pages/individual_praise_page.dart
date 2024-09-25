import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/app_theme.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/core/widgets/custom_app_bar.dart';
import 'dart:async';
import 'dart:math' as math;

class IndividualPraisePage extends StatefulWidget {
  const IndividualPraisePage({super.key});

  @override
  _IndividualPraisePageState createState() => _IndividualPraisePageState();
}

List<int> indexList = [10, 8, 5, 12, 4, 50, 6, 9, 8, 9]; //! change the angle
List<String> praises = [
  'سبحان الله',
  'استغفر الله',
  'لا اله الا الله',
];

class _IndividualPraisePageState extends State<IndividualPraisePage> {
  final start = ValueNotifier(false);
  double scrollPosition = 0.0;
  int topIndex = 0;
  int topIndexCont = 0;
  int remaining = 0;
  String selectedPraise = '';
  late PageController _pageController;
  int currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
    selectedPraise = praises[currentPageIndex];
    _pageController =
        PageController(initialPage: currentPageIndex, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.getBackgroundGradient(isDarkTheme),
        ),
        child: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: context.screenHeight),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  CustomAppBar(
                    isDarkTheme: isDarkTheme,
                    text: AppStrings.individualPraise,
                  ),
                  remaining == 0
                      ? SizedBox(
                          height: 35,
                        )
                      : _buildTargetContainer(isDarkTheme),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                  remaining == 0
                      ? SizedBox(
                          height: 24,
                        )
                      : _buildRemainingContainer(),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  remaining == 0
                      ? _buildPraiseSelectionPageView(isDarkTheme)
                      : Center(
                          child: _buildSelectedPraiseContainer(isDarkTheme)),

                  SizedBox(
                    height: context.screenHeight * 0.04,
                  ), // remaining == 0
                  //     ? SizedBox(
                  //         height: 30,
                  //       )
                  //     : Center(child: Image.asset(AppImages.getFrame(isDarkTheme))),
                  GestureDetector(
                      onTap: () {
                        if (remaining > 0) {
                          setState(() {
                            remaining--;
                            if (remaining == 0) {
                              _showCompletedDialog(context);
                            }
                          });
                        }
                      },
                      child: _buildStackWheel()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRemainingContainer() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 112,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.containerColor,
        ),
        child: Center(
          child: Text(
            '$remaining المتبقي',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTargetContainer(bool isDarkTheme) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 150,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.containerColor,
            ),
            child: Center(
                child: Text(
              'target :$topIndexCont',
              style: TextStyle(
                color: Colors.black,
              ),
            )),
          ),
          Positioned(
            right: -10,
            top: -8,
            child: Image.asset(
              AppImages.getGroup(isDarkTheme),
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            right: 5,
            top: 10,
            child: Text(
              'الهدف',
              style: TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w400,
                color: AppColors.containerColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPraiseSelectionPageView(bool isDarkTheme) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 170,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: praises.length,
          onPageChanged: (value) {
            setState(() {
              selectedPraise = praises[value];
              currentPageIndex = value;
            });
          },
          itemBuilder: (context, index) {
            double scale = (currentPageIndex == index) ? 1 : 0.9;
            Color containerColor = (currentPageIndex == index)
                ? (isDarkTheme
                    ? AppColors.darkDialog
                    : AppColors.lightGradientEnd)
                : (isDarkTheme
                    ? AppColors.darkDialog.withOpacity(0.5)
                    : AppColors.lightShareContainer);
            return Transform.scale(
              scale: scale,
              child: Container(
                width: 280,
                height: 170,
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(18)),
                child: Center(
                  child: Text(
                    praises[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildSelectedPraiseContainer(bool isDarkTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 310,
      height: 170,
      //  margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color:
              isDarkTheme ? AppColors.darkDialog : AppColors.lightGradientEnd,
          borderRadius: BorderRadius.circular(18)),
      child: Center(
        child: Text(
          selectedPraise,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 30,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  void _showCompletedDialog(BuildContext contex) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.whiteColor,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.employee,
                ),
                const Text(
                  'تم انجاز الجلسة بنجاح !',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            )),
          ),
        );
      },
    );
    setState(() {
      topIndex = 0;
      currentPageIndex = 1;
      selectedPraise = praises[currentPageIndex];
    });
  }

  Widget _buildStackWheel() {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onVerticalDragStart: (details) {
            if (remaining == 0) {
              _startScroll();
            } else {
              start.value = !start.value;
            }
          },
          onHorizontalDragStart: (details) {
            if (remaining == 0) {
              _startScroll();
            } else {
              start.value = !start.value;
            }
          },
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffFFF8C7),
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.all(context.screenWidth * 0.05),
              width: context.screenWidth * 0.85,
              height: context.screenWidth * 0.85,
              child: ValueListenableBuilder(
                valueListenable: start,
                builder: (context, started, _) {
                  return CustomPaint(
                    painter: CirclePainter(
                      containerCount: indexList.length,
                      containerColor: Colors.transparent,
                      containerRadius: // containerSize
                          context.screenWidth * 0.1,
                      containerTextSize: context.screenWidth * 0.04,
                      scrollPosition: scrollPosition,
                      circleSize: context.screenWidth * 0.85,
                    ),
                  )
                      .animate(
                        target: started ? 1 : 0,
                        onPlay: (controller) => controller.reverse(),
                        onComplete: (controller) => debugPrint('complet'),
                      )
                      .shake(hz: 3);
                },
              ),
            ),
          ),
        ),
        Positioned(
            top: context.screenWidth * 0.015,
            child: Icon(
              Icons.arrow_drop_down,
              size: context.screenWidth * 0.08,
              color: Colors.black,
            )),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: context.screenWidth * 0.65, //innerContainerSize * 65,
            height: context.screenWidth * 0.65, // innerContainerSize * 65,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 216, 194, 169),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: context.screenWidth * 0.5,
                height: context.screenWidth * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.mandala),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: // innerContainerSize
                context.screenWidth * 0.12,
            height: context.screenWidth * 0.12,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(-2, -2))
              ],
              color: Color(0xffFFF8C7),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: (remaining == 0)
                  ? const Icon(
                      Icons.rotate_left_rounded,
                      color: Colors.black,
                    )
                  : Text(
                      'انقر',
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.04,
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void _startScroll() {
    final random = math.Random();
    final double targetAngle = math.pi * 2 * random.nextDouble();
    //? the fun nextDouble: generate double between 0 and 1, when multip with 2*pi will by in range (0 to 2π)
    final double diff = targetAngle - scrollPosition;
    //? this diff will be used to determine how much the scroll position will change
    //? تايمر دوري :
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        scrollPosition += diff.sign * 0.1; //? creates a smooth scrolling effect
        if ((scrollPosition - targetAngle).abs() < 0.1) {
          //? if its ture the animation considered complete, that why we cancel
          scrollPosition = targetAngle; //? to ensure it reaches exaclty
          timer.cancel();
          final double topAngle = (-math.pi / 3) -
              scrollPosition; //?60- scroll, to idntified(item) regardless of the current scroll position
          final double containerAngle = topAngle - (math.pi / indexList.length);
          final double indexDouble = containerAngle /
              (2 *
                  math.pi /
                  indexList
                      .length); //? to calculates the angle between each item in the circle.
          topIndex =
              (indexDouble.round() + indexList.length) % indexList.length;
          topIndexCont = indexList[topIndex];
          remaining = topIndexCont;

          print("Index of top container after scroll: $topIndex");
          print("the content of the $topIndex is $topIndexCont");
        }
      });
    });
  }
}

class CirclePainter extends CustomPainter {
  final int containerCount;
  final Color containerColor;
  final double containerRadius;
  final double containerTextSize;
  final double scrollPosition;
  final double circleSize;

  CirclePainter({
    required this.containerCount,
    required this.containerColor,
    required this.containerRadius,
    required this.containerTextSize,
    required this.scrollPosition,
    required this.circleSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(circleSize / 2, circleSize / 2);
    final radius = circleSize / 2.2;

    final paint = Paint()..color = containerColor;

    // Draw each number at its position
    for (int index = 0; index < containerCount; index++) {
      // Compute the angle for this index, adjusted by scrollPosition
      final double angle =
          (2 * math.pi * index) / containerCount + scrollPosition;

      // Calculate the position of the item along the circle's circumference
      final double itemX = radius * math.cos(angle);
      final double itemY = radius * math.sin(angle);
      final Offset itemCenter = center.translate(itemX, itemY);

      // Draw the circle background if necessary (currently transparent)
      canvas.drawCircle(itemCenter, containerRadius, paint);

      // Save canvas state before rotation
      canvas.save();

      // Move the canvas to the text position and rotate it inversely to the angle
      canvas.translate(itemCenter.dx, itemCenter.dy);
      canvas.rotate(
          angle + math.pi / 2); // Rotate to face inward towards the center

      // Draw the text at the translated and rotated position
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${indexList[index]}',
          style: TextStyle(
            fontSize: containerTextSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));

      // Restore the canvas state after drawing the text
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
