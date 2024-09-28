import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/core/widgets/add_button.dart';
import 'package:serag/core/widgets/date_range_dialog.dart';
import 'package:serag/core/widgets/custom_drop_down_field.dart';
import 'package:serag/core/widgets/custom_date_range_picker.dart';
import 'package:serag/core/widgets/share_button.dart';

class PraiseFormContainer extends StatefulWidget {
  final bool isDarkTheme;
  const PraiseFormContainer({super.key, required this.isDarkTheme});

  @override
  State<PraiseFormContainer> createState() => _PraiseFormContainerState();
}

class _PraiseFormContainerState extends State<PraiseFormContainer> {
  double _sliderValue = 0;
  DateTimeRange? _selectDateRange;
  String? selectedValue;

  final List<String> dhikrItems = [
    AppStrings.istighfar,
    AppStrings.salatAlaAlNabi,
    AppStrings.hawqala,
    AppStrings.basmala,
    AppStrings.tahlil,
    AppStrings.takbir,
    AppStrings.tasbih,
  ];

  int _calculateValue(double sliderValue) {
    if (sliderValue <= 10) {
      return (sliderValue * 100).toInt(); //100 to 1000
    } else {
      return (1000 + (sliderValue - 10) * 2000).toInt(); //2000,4000
    }
  }

  Future<void> _selectRange(BuildContext context, bool isDarkTheme) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: _selectDateRange,
      builder: (context, child) {
        return DateRangeDialog(isDarkTheme: isDarkTheme, child: child!);
      },
    );
    if (picked != null && picked != _selectDateRange) {
      setState(() {
        _selectDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: context.screenHeight,
      decoration: BoxDecoration(
        color: widget.isDarkTheme
            ? AppColors.darkDialog
            : AppColors.lightGradientEnd,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Text(
            AppStrings.dhikr,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: context.screenWidth * 0.05,
            ),
          ).animate().fade(duration: 0.3.seconds, delay: .1.seconds),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          CustomDropDownField(
              items: dhikrItems,
              selectedValue: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              }).animate().fade(duration: 0.5.seconds, delay: .2.seconds),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Text(
            AppStrings.durationOfDhiker,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: context.screenWidth * 0.05,
            ),
          ).animate().fade(duration: 0.7.seconds, delay: .3.seconds),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          CustomDateRangePicker(
            onTap: () => _selectRange(context, widget.isDarkTheme),
            selectedDateRange: _selectDateRange,
          ).animate().fade(duration: 0.9.seconds, delay: .4.seconds),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
          Text(
            AppStrings.imposedNumber,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: context.screenWidth * 0.05,
            ),
          ).animate().fade(duration: 1.3.seconds, delay: .6.seconds),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                valueIndicatorTextStyle:
                    const TextStyle(color: AppColors.whiteColor)),
            child: Slider(
              inactiveColor: AppColors.containerColor,
              thumbColor: AppColors.containerColor,
              activeColor: widget.isDarkTheme
                  ? AppColors.darkShareContainer
                  : AppColors.lightGradientMiddle3,
              value: _sliderValue,
              min: 0,
              max: 20,
              divisions: 20,
              label: 'Value:${_calculateValue(_sliderValue)}',
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ).animate().fade(duration: 1.5.seconds, delay: .7.seconds),
          ),
          ShareButton(
            isDarkTheme: widget.isDarkTheme,
          ).animate().fade(duration: 1.7.seconds, delay: .8.seconds),
          SizedBox(
            height: context.screenHeight * 0.04,
          ),
          AddButton(isDarkTheme: widget.isDarkTheme)
              .animate()
              .fade(duration: 1.9.seconds, delay: 1.seconds),
          SizedBox(
            height: context.screenHeight * 0.02,
          )
        ],
      ),
    );
  }
}
