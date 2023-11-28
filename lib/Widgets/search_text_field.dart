

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final bool isSearch;
  final TextEditingController searchController;
  final void Function(String) onChanged;
  const SearchTextField({
    super.key,
    required this.isSearch,
    required this.searchController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      height: 50.h,
      child: Visibility(
        visible: isSearch,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: whiteColor, width: .5),
              borderRadius: BorderRadius.circular(100.sp)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: TextFormField(
              controller: searchController,
              onChanged: onChanged,
              style: const TextStyle(
                color: whiteColor,
              ),
              cursorColor: whiteColor,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: whiteColor)),
            ),
          ),
        ),
      ),
    );
  }
}