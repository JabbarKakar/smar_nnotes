import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smar_notes/Utils/app_constants.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_text.dart';

class StepperWidget extends StatelessWidget {
  final String serialNum;
  const StepperWidget({
    super.key, required this.serialNum,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text20(text: serialNum, color: greyColor,),
          10.wd,
          Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 55.h,
                    child: VerticalDivider(
                      color: whiteColor,
                      thickness: 5.sp,
                    ),
                  ),
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h, left: 15.w),
              child: Container(
                height: 80.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: whiteColor,
                      width: 5,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.ht,
                    const Text12(text: 'Locations: ()',),
                    5.ht,
                    const Text20(text: '0 Entries', color: greyColor,),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}