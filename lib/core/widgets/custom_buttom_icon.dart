import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtomIcon extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const CustomButtomIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 24.h,
        width: 24.w,
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
