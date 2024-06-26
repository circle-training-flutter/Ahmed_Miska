import 'package:circletraning/core/theming/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class SearchBaar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  const SearchBaar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // height: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.grayLight,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: ColorManger.red,
              size: 20.sp,
            ),
            hintText: 'search'.tr(),
            hintStyle: TextStyles.font12MadaRegularGray,
          ),
          onChanged: onChanged,
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 16.7.h, horizontal: 9.w),
        //   child: Row(
        //     children: [
        //       horizontalSpace(9),
        //       Icon(
        //         Icons.search,
        //         color: ColorManger.red,
        //         size: 20.sp,
        //       ),
        //       horizontalSpace(8),
        //       Text(
        //         'search',
        //         style: TextStyles.font12MadaRegularGray,
        //       ).tr(),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
