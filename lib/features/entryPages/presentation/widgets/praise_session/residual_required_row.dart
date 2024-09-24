import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';


class ResidualAndRequiredRow extends StatelessWidget {
  const ResidualAndRequiredRow({
    super.key,
    required this.residualText,
    required this.requiredText,
  });
  final String residualText;
  final String requiredText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                AppStrings.required,
                style: TextStyle(
                  fontSize: context.screenWidth * 0.045,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                requiredText,
                style: TextStyle(
                  color: AppColors.lightTextTime,
                  fontSize: context.screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                AppStrings.residual,
                style: TextStyle(
                  fontSize: context.screenWidth * 0.045,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                residualText,
                style: TextStyle(
                  color: AppColors.lightTextTime,
                  fontSize: context.screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
