import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/app_theme.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/widgets/card_seals.dart';
import 'package:serag/features/entryPages/presentation/widgets/custom_floating_action_button.dart';
import 'package:serag/features/entryPages/presentation/widgets/title_row.dart';


class SealPage extends StatefulWidget {
  const SealPage({super.key});

  @override
  State<SealPage> createState() => _SealPageState();
}

class _SealPageState extends State<SealPage> {
  bool _isContainerVisible = false;
  String? selectedValue;
  final List<String> items = [
    AppStrings.facilitationOfTheOrder,
    AppStrings.healingAPatient,
    AppStrings.onTheSoulOfAMuslim,
    AppStrings.reliefSadness,
    AppStrings.relieveANeed,
  ];
  DateTimeRange? _selectedDateRange;
  bool _isDawn = false;
  bool _isPriority = false;

  Future<void> _selectDateRange(BuildContext context, bool isDarkTheme) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: _selectedDateRange,
      builder: (BuildContext context, Widget? child) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: context.screenWidth * 0.8, // 300,
                maxHeight: context.screenHeight * 0.7 //530,
                ),
            child: Theme(
              data: ThemeData(
                colorScheme: isDarkTheme
                    ? ColorScheme.dark(
                        primary: AppColors.darkGradientStart,
                        onPrimary: AppColors.whiteColor,
                        surface: AppColors.whiteColor,
                        onSurface: Colors.black,
                        secondary: AppColors.darkGradientStart.withOpacity(0.2),
                      )
                    : ColorScheme.light(
                        primary: AppColors.lightGradientEnd,
                        onPrimary: AppColors.whiteColor,
                        surface: AppColors.whiteColor,
                        onSurface: Colors.black,
                        secondary: AppColors.lightGradientEnd.withOpacity(0.2),
                      ),
              ),
              child: child!,
            ),
          ),
        );
      },
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
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
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isContainerVisible = false;
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: isDarkTheme
                                ? AppColors.darkArrow
                                : AppColors.lightGradientEnd,
                          ),
                        ),
                        SizedBox(
                          width: context.screenWidth * 0.18,
                        ),
                        TitleRow(
                          text: AppStrings.seals,
                          isDarkTheme: isDarkTheme,
                        )
                      ],
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
              ),
              AnimatedPositioned(
                duration: const Duration(
                  milliseconds: 700,
                ),
                curve: Curves.easeInOut,
                top: _isContainerVisible
                    ? context.screenHeight * 0.45
                    : context.screenHeight,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: _isContainerVisible ? context.screenHeight : 0,
                  decoration: BoxDecoration(
                    color: isDarkTheme
                        ? AppColors.darkDialog
                        : AppColors.lightGradientEnd,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: context.screenHeight * 0.01,
                      ),
                      Text(
                        AppStrings.intention,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: context.screenWidth * 0.05),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      Center(
                        child: Container(
                          width: context.screenWidth * 0.85, //260,
                          height: context.screenHeight * 0.06, //39,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonFormField(
                              value: selectedValue,
                              iconSize: 0,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: isDarkTheme
                                      ? AppColors.darkDialog
                                      : AppColors.lightGradientEnd,
                                ),
                              ),
                              isExpanded: true,
                              items: items.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Center(
                                      child: Text(
                                    item,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: isDarkTheme
                                            ? AppColors.darkGradientMiddle5
                                            : AppColors.lightTitle),
                                  )),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      Text(
                        AppStrings.durationOfSeal,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: context.screenWidth * 0.05,
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => _selectDateRange(context, isDarkTheme),
                          child: Container(
                            width: context.screenWidth * 0.85, //260,
                            height: context.screenHeight * 0.06, //39,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: _selectedDateRange == null
                                ? null
                                : Center(
                                    child: Text(
                                      '${_formatDate(_selectedDateRange!.start)}|${_formatDate(_selectedDateRange!.end)}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              context.screenWidth * 0.04, // 16,
                                          color: isDarkTheme
                                              ? AppColors.darkGradientMiddle5
                                              : AppColors.lightTitle),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.priority,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: context.screenWidth * 0.04, //15,
                            ),
                          ),
                          Checkbox(
                            checkColor: Colors.green,
                            fillColor: const WidgetStatePropertyAll(
                                AppColors.whiteColor),
                            value: _isPriority,
                            onChanged: (value) {
                              setState(
                                () {
                                  _isPriority = !_isPriority;
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: context.screenWidth * 0.4,
                          ),
                          Text(
                            AppStrings.dawn,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: context.screenWidth * 0.04, //15,
                            ),
                          ),
                          Checkbox(
                            checkColor: Colors.green,
                            fillColor: const WidgetStatePropertyAll(
                                AppColors.whiteColor),
                            value: _isDawn,
                            onChanged: (value) {
                              setState(
                                () {
                                  _isDawn = !_isDawn;
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
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
}
