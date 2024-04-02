import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/svg_icon.dart';

class SelectPhoto extends StatelessWidget {
  const SelectPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.w,
      height: 124.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: ColorManger.grayLight,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: SVGIcon(
              AppIcons.mainLogoIconGray,
              width: 64.w,
              height: 39.h,
            ),
          ),
          Positioned(
            bottom: 5.h,
            right: 5.w,
            child: GestureDetector(
              onTap: () {},
              child: SVGIcon(AppIcons.addPhoto),
            ),
          ),
        ],
      ),
    );
  }
}
