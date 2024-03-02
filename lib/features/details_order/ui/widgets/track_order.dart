import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'liner_idecator.dart';

class TrackOrder extends StatelessWidget {
  final String icon;
  final String title;
  final double value;
  const TrackOrder({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(color: ColorManger.red),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            horizontalSpace(8),
            Text(
              title,
              style: TextStyles.font14MadaRegularBlack
                  .copyWith(color: ColorManger.gray),
            ).tr()
          ],
        ),
        verticalSpace(10),
        LinerIndecator(value: value),
      ],
    );
  }
}
