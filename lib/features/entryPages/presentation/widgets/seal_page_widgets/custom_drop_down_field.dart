import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class CustomDropDownField extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  const CustomDropDownField(
      {super.key,
      this.selectedValue,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Center(
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 40),
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
                    fontSize: context.screenWidth * 0.04, //16,
                    color: isDarkTheme
                        ? AppColors.darkGradientMiddle5
                        : AppColors.lightTitle),
              )),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
