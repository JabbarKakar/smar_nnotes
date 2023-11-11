
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smar_notes/Utils/app_constants.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_images.dart';
import '../Utils/app_text.dart';

class StartRecording extends StatelessWidget {
  final void Function() onTap;
  const StartRecording({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        90.ht,
        const Text20(
          text: 'Focus on the meeting... we\nwill take care about your\nnotes',
        ),
        75.ht,
        InkWell(
          onTap: onTap,
          child: Container(
            height: 220.h,
            width: 220.h,
            decoration: const BoxDecoration(
                color: primaryColor3,
                shape: BoxShape.circle
            ),
            child: Center(
              child: SizedBox(
                  height: 126.h,
                  width: 100.w,
                  child: SvgPicture.asset(AppImages.mic)),
            ),
          ),
        ),
        115.ht,
        const Text20(
          text: 'Recording in Progress\n...',
        ),
      ],
    );
  }
}