import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class RowOfNoteOfTheOrder extends StatelessWidget {
  final String icon;
  final String title;
  final String primTitle;
  const RowOfNoteOfTheOrder({
    super.key,
    required this.icon,
    required this.title,
    required this.primTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20.h,
          width: 20.w,
          child: SvgPicture.asset(icon),
        ),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.font12MadaRegularGray,
            ).tr(),
            verticalSpace(3),
            Text(
              primTitle,
              style: TextStyles.font14MadaRegularBlack,
            ).tr()
          ],
        )
      ],
    );
  }
}
