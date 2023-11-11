import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';

class DecorationButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  const DecorationButton({
    super.key, required this.onTap, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 33.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15.r)
          ),
          child: Icon(icon)
      ),
    );
  }
}