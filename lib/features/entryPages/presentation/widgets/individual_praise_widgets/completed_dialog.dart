import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/utils/build_context_extensions.dart';

class CompletedDialog extends StatelessWidget {
  const CompletedDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      child: SizedBox(
        width: context.screenWidth * 0.5,
        height: context.screenHeight * 0.3,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Image.asset(
              AppImages.employee,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Text(
              AppStrings.sessionDone,
              style: TextStyle(
                fontSize: context.screenWidth * 0.05, //20,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            const Divider(
              color: AppColors.blackColor,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    AppStrings.done,
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.04, //12
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
