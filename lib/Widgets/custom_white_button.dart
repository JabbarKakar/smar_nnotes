import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_text.dart';

class CustomWhiteButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final void Function()? onLongPress;
  const CustomWhiteButton({
    super.key, required this.text, required this.onTap, this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        height: 57.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(15.r)
        ),
        child: Center(
          child: Text14(
            text: text,
            alignment: Alignment.center,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
        ),
      ),
    );
  }
}
