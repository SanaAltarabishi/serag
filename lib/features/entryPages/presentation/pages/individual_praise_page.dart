import 'package:flutter/material.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/app_theme.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/core/widgets/custom_app_bar.dart';
import 'package:serag/features/entryPages/presentation/widgets/individual_praise_widgets/completed_dialog.dart';
import 'package:serag/features/entryPages/presentation/widgets/individual_praise_widgets/praise_selection_page_view.dart';
import 'package:serag/features/entryPages/presentation/widgets/individual_praise_widgets/remaining_container.dart';
import 'package:serag/features/entryPages/presentation/widgets/individual_praise_widgets/selected_praise_container.dart';
import 'package:serag/features/entryPages/presentation/widgets/individual_praise_widgets/stack_wheel.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:serag/features/entryPages/presentation/widgets/individual_praise_widgets/target_container.dart';

class IndividualPraisePage extends StatefulWidget {
  const IndividualPraisePage({super.key});

  @override
  _IndividualPraisePageState createState() => _IndividualPraisePageState();
}

List<int> indexList = [10, 8, 5, 12, 4, 50, 6, 9, 8, 9];
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
          child: Column(
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
                      height: context.screenHeight * 0.042,
                    )
                  : TargetContainer(
                      isDarkTheme: isDarkTheme,
                      topIndexCont: topIndexCont,
                    ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              remaining == 0
                  ? SizedBox(
                      height: context.screenHeight * 0.04,
                    )
                  : RemainingContainer(remaining: remaining),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              remaining == 0
                  ? PraiseSelectionPageView(
                      isDarkTheme: isDarkTheme,
                      praises: praises,
                      currentPageIndex: currentPageIndex,
                      onPageChanged: (value) {
                        setState(() {
                          selectedPraise = praises[value];
                          currentPageIndex = value;
                        });
                      },
                    )
                  : Center(
                      child: SelectedPraiseContainer(
                        isDarkTheme: isDarkTheme,
                        selectedPraise: selectedPraise,
                      ),
                    ),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              StackWheel(
                indexList: indexList,
                scrollPosition: scrollPosition,
                remaining: remaining,
                valueListenable: start,
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
                onTap: () {
                  if (remaining > 0) {
                    setState(
                      () {
                        remaining--;
                        if (remaining == 0) {
                          _showCompletedDialog(context);
                        }
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showCompletedDialog(BuildContext contex) {
    showDialog(
      context: context,
      builder: (context) {
        return const CompletedDialog();
      },
    );
    setState(() {
      topIndex = 0;
      currentPageIndex = 1;
      selectedPraise = praises[currentPageIndex];
    });
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
