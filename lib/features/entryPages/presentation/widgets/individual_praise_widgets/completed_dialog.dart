import 'package:flutter/material.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
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
            SizedBox(height: context.screenHeight*0.02,),
            Image.asset(
              AppImages.employee,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            const Text(
              '!تم انجاز الجلسة بنجاح',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Divider(
              color: Colors.black,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text('تم', style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
