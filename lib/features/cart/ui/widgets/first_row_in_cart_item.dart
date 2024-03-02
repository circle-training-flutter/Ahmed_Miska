
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class FirstRowInCartItem extends StatelessWidget {
  const FirstRowInCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 66.67.h,
          width: 100.w,
          child: Image.asset(Assets.pic3),
        ),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'salmon',
              style: TextStyles.font14MadaRegularBlack,
            ).tr(),
            Row(
              children: [
                SvgPicture.asset(AppIcons.priceIcon),
                horizontalSpace(4),
                Text(
                  'price',
                  style: TextStyles
                      .font16MadaSemiBoldBlack,
                ).tr(),
                horizontalSpace(4),
                Text(
                  'egp',
                  style:
                      TextStyles.font12MadaRegularBlack,
                ).tr(),
              ],
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w, vertical: 10.h),
          child: SizedBox(
            height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(
              AppIcons.deleteIcon,
            ),
          ),
        )
      ],
    );
  }
}
