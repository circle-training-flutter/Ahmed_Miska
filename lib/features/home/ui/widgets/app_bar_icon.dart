import 'package:circletraning/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  const AppBarIcon({
    super.key,
    required this.icon,
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
      child: Icon(
        icon,
        size: 24.sp,
      ),
    );
  }
}
