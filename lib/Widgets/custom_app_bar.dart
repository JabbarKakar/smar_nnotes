import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_images.dart';
import '../Utils/app_text.dart';
import '../Views/Explorer View/explorer_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final void Function() onTapMenu;
  final void Function() onTapProfile;
  const CustomAppBar({
    super.key,
    required this.text,
    required this.onTapMenu,
    required this.onTapProfile,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blackColor,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: InkWell(
          onTap: onTapMenu,
          child: SizedBox(
              height: 38.h,
              width: 56.w,
              child: SvgPicture.asset(AppImages.menu)),
        ),
      ),
      title: Text30(text: text),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: InkWell(
            onTap: onTapProfile,
            child: SizedBox(
                height: 56.h,
                width: 56.h,
                child: SvgPicture.asset(AppImages.profile)),
          ),
        ),
      ],
    );
  }
}