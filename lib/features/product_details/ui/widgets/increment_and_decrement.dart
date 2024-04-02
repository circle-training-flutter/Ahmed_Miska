import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncrementAndDecrement extends StatelessWidget {
  final Color? color;
  final String icon;
  final Function()? onTap;
  const IncrementAndDecrement({
    super.key,
    this.color,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SVGIcon(
            icon,
            height: 16.h,
            width: 16.w,
          )),
    );
  }
}
