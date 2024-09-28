import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class RemainingContainer extends StatelessWidget {
  final int remaining;
  const RemainingContainer({super.key, required this.remaining});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Container(
        width: context.screenWidth * 0.25, //112,
        height: context.screenHeight * 0.04, //24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.containerColor,
        ),
        child: Center(
          child: Text(
            '$remaining المتبقي',
            style: TextStyle(
              fontSize: context.screenWidth * 0.04, //18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
