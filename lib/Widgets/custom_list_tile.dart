import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_text.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final void Function() onTapTile;
  final void Function() onTapEdit;
  const CustomListTile({
    super.key,
    required this.title,
    required this.onTapTile,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: onTapTile,
        child: Container(
          height: 57.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(15.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text14(
                      text: title,
                      alignment: Alignment.bottomLeft,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                InkWell(
                  onTap: onTapEdit,
                  child: Container(
                    height: 28.h,
                    width: 98.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor, width: 3),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: const Center(
                      child: Text14(
                          text: 'Edit',
                          alignment: Alignment.center,
                          color: blackColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}