import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/colors.dart';

class SelectProfileImage extends StatelessWidget {
  const SelectProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          height: 96.h,
          width: 96.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.black,
            border: Border.all(
              color: ColorManger.red,
              width: 2,
            ),
            image: DecorationImage(
              image: AssetImage(
                Assets.profile,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -8.h,
          left: -8.w,
          child: Container(
            height: 36.h,
            width: 36.h,
            decoration: BoxDecoration(
              color: ColorManger.white,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),
              child: SvgPicture.asset(
                AppIcons.editProfileIcon,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
