import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/consatants.dart';
import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

customShowDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 350.h,
          // width: 351.w,
          constraints: BoxConstraints(minHeight: 323.h, minWidth: 351.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36.r),
            color: ColorManger.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
            child: Column(
              children: [
                SizedBox(
                  height: 203.h,
                  width: 303.w,
                  child: Image.asset(Assets.doneGIF),
                ),
                verticalSpace(24),
                Text(
                  'the_request_has_been_sent_successfully',
                  style: TextStyles.font16MadaRegularBlack
                      .copyWith(color: ColorManger.gray),
                ).tr()
              ],
            ),
          ),
        ),
      );
    },
  );
}
