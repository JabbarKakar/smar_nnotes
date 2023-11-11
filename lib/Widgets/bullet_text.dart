import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smar_notes/Utils/app_constants.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_text.dart';

class BulletText extends StatelessWidget {
  final String text;
  const BulletText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.brightness_1, color: whiteColor, size: 8.sp,),
        10.wd,
        Text20(text: text, color: whiteColor, textAlign: TextAlign.left)
      ],
    );
  }
}