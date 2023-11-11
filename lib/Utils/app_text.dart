import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class Text30 extends StatelessWidget {
  final String text;
  final BoxBorder? border;
  const Text30({super.key, required this.text, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      decoration: BoxDecoration(
        border: border == null
            ? const Border(
                bottom: BorderSide(
                  color: whiteColor,
                  width: .8,
                ),
              )
            : null,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: 1,
          fontFamily: inter,
          color: whiteColor,
          fontWeight: FontWeight.w700,
          fontSize: 30.sp,
        ),
      ),
    );
  }
}

class Text20 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  const Text20({super.key, required this.text, this.color, this.textAlign, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        letterSpacing: 1,
        fontFamily: inter,
        color: color ?? whiteColor,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: 20.sp,
      ),
    );
  }
}

class Text10 extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Text10({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: .5,
          fontFamily: inter,
          color: whiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}

class Text14 extends StatelessWidget {
  final String text;
  final AlignmentGeometry alignment;
  final FontWeight? fontWeight;
  final Color? color;
  const Text14(
      {super.key,
      required this.text,
      required this.alignment,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: .5,
          fontFamily: inter,
          color: color ?? whiteColor,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class Text12 extends StatelessWidget {
  final String text;
  const Text12({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: .5,
        fontFamily: inter,
        color: whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      ),
    );
  }
}
