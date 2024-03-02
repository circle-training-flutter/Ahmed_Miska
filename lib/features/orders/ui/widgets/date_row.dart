
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 21.h,
          width: 147.5.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.w,
                child: SvgPicture.asset(
                  AppIcons.calenderIcon,
                ),
              ),
              horizontalSpace(8),
              Text(
                'date',
                style: TextStyles.font14MadaRegularBlack,
              ).tr(),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 21.h,
          width: 147.5.w,
          child: Row(
            children: [
              SizedBox(
                height: 20.h,
                width: 20.w,
                child: SvgPicture.asset(
                  AppIcons.timerIcon,
                ),
              ),
              horizontalSpace(8),
              Text(
                'time',
                style: TextStyles.font14MadaRegularBlack,
              ).tr()
            ],
          ),
        )
      ],
    );
  }
}