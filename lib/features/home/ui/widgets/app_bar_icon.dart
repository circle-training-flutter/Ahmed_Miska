import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class AppBarIcon extends StatelessWidget {
  final String icon;
  final bool check;
  final int? number;
  const AppBarIcon({
    super.key,
    required this.icon,
    required this.check,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.sp,
      width: 48.sp,
      decoration: BoxDecoration(
        color: ColorManger.grayLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SVGIcon(icon),
          ),
          check
              ? Positioned(
                  right: 8.w,
                  top: 5.h,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManger.white,
                        width: 1.w,
                      ),
                      color: ColorManger.red,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          number == null
                              ? '  '
                              : number! > 99
                                  ? '99+'
                                  : number.toString(),
                          style: TextStyles.font10MadaRegularBlack
                              .copyWith(color: ColorManger.white),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
