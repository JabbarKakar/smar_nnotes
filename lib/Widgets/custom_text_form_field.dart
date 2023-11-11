import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(15.sp)),
      child: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          obscuringCharacter: "*",
          style: TextStyle(
            color: whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontFamily: inter,
          ),
          cursorColor: whiteColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: whiteColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: inter,
              )),
        ),
      )),
    );
  }
}
