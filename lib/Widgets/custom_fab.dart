import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_images.dart';

class CustomFAB extends StatelessWidget {
  final void Function() onTap;
  const CustomFAB({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 80.h,
        decoration: const BoxDecoration(
            color: blackColor,
            shape: BoxShape.circle
        ),
        child: Center(
          child: SizedBox(
              height: 50.h,
              width: 50.h,
              child: SvgPicture.asset(AppImages.mic)),
        ),
      ),
    );
  }
}