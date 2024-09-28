import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class CustomDateRangePicker extends StatelessWidget {
  final DateTimeRange? selectedDateRange;
  final void Function()? onTap;
  const CustomDateRangePicker({super.key, this.selectedDateRange, this.onTap});

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: context.screenWidth * 0.85, //260,
          height: context.screenHeight * 0.06, //39,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: selectedDateRange == null
              ? null
              : Center(
                  child: Text(
                    '${_formatDate(selectedDateRange!.start)}|${_formatDate(selectedDateRange!.end)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.04, // 16,
                      color: isDarkTheme
                          ? AppColors.darkGradientMiddle5
                          : AppColors.lightTitle,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
