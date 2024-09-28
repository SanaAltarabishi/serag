import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/core/widgets/date_range_dialog.dart';
import 'package:serag/core/widgets/add_button.dart';
import 'package:serag/core/widgets/custom_date_range_picker.dart';
import 'package:serag/core/widgets/custom_drop_down_field.dart';
import 'package:serag/core/widgets/share_button.dart';

class SealFormContainer extends StatefulWidget {
  final bool isDarkTheme;
  const SealFormContainer({super.key, required this.isDarkTheme});

  @override
  State<SealFormContainer> createState() => _SealFormContainerState();
}

class _SealFormContainerState extends State<SealFormContainer> {
  DateTimeRange? _selectedDateRange;
  bool _isDawn = false;
  bool _isPriority = false;
  String? selectedValue;

  final List<String> items = [
    AppStrings.facilitationOfTheOrder,
    AppStrings.healingAPatient,
    AppStrings.onTheSoulOfAMuslim,
    AppStrings.reliefSadness,
    AppStrings.relieveANeed,
  ];

  Future<void> _selectDateRange(BuildContext context, bool isDarkTheme) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: _selectedDateRange,
      builder: (BuildContext context, Widget? child) {
        return DateRangeDialog(
          isDarkTheme: isDarkTheme,
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: // _isContainerVisible ?
          context.screenHeight, //: 0,
      decoration: BoxDecoration(
        color: widget.isDarkTheme
            ? AppColors.darkDialog
            : AppColors.lightGradientEnd,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
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
          ).animate().fade(duration: 0.3.seconds, delay: .1.seconds),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          CustomDropDownField(
              items: items,
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
            AppStrings.durationOfSeal,
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
            onTap: () => _selectDateRange(context, widget.isDarkTheme),
            selectedDateRange: _selectedDateRange,
          ).animate().fade(duration: 0.9.seconds, delay: .4.seconds),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
          _buildCheckboxRow(context)
              .animate()
              .fade(duration: 1.1.seconds, delay: .5.seconds),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          ShareButton(
            isDarkTheme: widget.isDarkTheme,
          ).animate().fade(duration: 1.3.seconds, delay: .6.seconds),
          SizedBox(
            height: context.screenHeight * 0.04,
          ),
          AddButton(isDarkTheme: widget.isDarkTheme)
              .animate()
              .fade(duration: 1.5.seconds, delay: .7.seconds),
          SizedBox(
            height: context.screenHeight * 0.02,
          )
        ],
      ),
    );
  }

  Row _buildCheckboxRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppStrings.priority,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: context.screenWidth * 0.04, //15,
          ),
        ),
        Checkbox(
          checkColor: Colors.green,
          fillColor: const WidgetStatePropertyAll(AppColors.whiteColor),
          value: _isPriority,
          onChanged: (value) {
            setState(
              () {
                _isPriority = !_isPriority;
                _isDawn = false;
              },
            );
          },
        ),
        SizedBox(
          width: context.screenWidth * 0.4,
        ),
        Text(
          AppStrings.dawn,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: context.screenWidth * 0.04, //15,
          ),
        ),
        Checkbox(
          checkColor: Colors.green,
          fillColor: const WidgetStatePropertyAll(AppColors.whiteColor),
          value: _isDawn,
          onChanged: (value) {
            setState(
              () {
                _isDawn = !_isDawn;
                _isPriority = false;
              },
            );
          },
        ),
      ],
    );
  }
}
