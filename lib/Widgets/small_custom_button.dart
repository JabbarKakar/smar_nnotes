import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_text.dart';

class SmallCustomButton extends StatelessWidget {
  final String? title;
  final void Function() onTap;
  final Widget? child;
  const SmallCustomButton({
    super.key,
    this.title,
    required this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 33.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: child ?? Text14(
            text: title!,
            alignment: Alignment.center,
            color: blackColor,
          ),
        ),
      ),
    );
  }
}