import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_text.dart';

class MainButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const MainButton({
    super.key, required this.onTap, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: whiteColor, width: 3.sp),
            borderRadius: BorderRadius.circular(15.sp)),
        child: Center(
          child: Text14(
              text: title,
              alignment: Alignment.center,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}