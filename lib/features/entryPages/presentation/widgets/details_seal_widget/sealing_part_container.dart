import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';


class SealingPartsContainer extends StatelessWidget {
  const SealingPartsContainer({
    super.key,
    required this.isDarkTheme,
    required this.gridIndex,
  });

  final bool isDarkTheme;
  final int gridIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDarkTheme ? AppColors.darkContainer : AppColors.containerColor,
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
          '${gridIndex + 1}',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: isDarkTheme ? AppColors.darkDialog : AppColors.lightTitle,
          ),
        ),
      ),
    );
  }
}
