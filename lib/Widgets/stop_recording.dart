
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smar_notes/Utils/app_constants.dart';

import '../Utils/app_images.dart';
import '../Utils/app_text.dart';

class StopRecording extends StatelessWidget {
  final void Function() onTap;
  const StopRecording({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        90.ht,
        const Text20(
          text: 'Want to start the meeting?\nWe are ready!',
        ),
        135.ht,
        InkWell(
          onTap: onTap,
          child: SizedBox(
              height: 126.h,
              width: 100.w,
              child: SvgPicture.asset(AppImages.mic)),
        ),
        160.ht,
        const Text20(
          text: 'To start the recording, press\nthe recording button.',
        ),
      ],
    );
  }
}