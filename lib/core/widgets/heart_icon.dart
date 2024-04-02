import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/consatants.dart';
import '../theming/colors.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({
    super.key,
  });

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checked = !checked;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManger.white,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: SVGIcon(
            AppIcons.heartIcon,
            height: 16.h,
            width: 16.w,
            color: checked ? ColorManger.red : null,
          ),
        ),
      ),
    );
  }
}
