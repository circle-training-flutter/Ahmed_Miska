
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class IncrementAndDecrement extends StatelessWidget {
  final Color? color;
  final String icon;
  const IncrementAndDecrement({
    super.key, this.color, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: color??Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SvgPicture.asset(
        icon,
        height: 16.h,
        width: 16.w,
        fit: BoxFit.none,
      ),
    );
  }
}