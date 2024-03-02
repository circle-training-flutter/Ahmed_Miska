
import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';

class PriceOfProduct extends StatelessWidget {
  const PriceOfProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.priceIcon),
            horizontalSpace(8),
            Text(
              'price_text',
              style: TextStyles.font14MadaRegularBlack,
            ).tr(),
            const Spacer(),
            Text(
              'price',
              style: TextStyles.font24MadaSemiBoldRed,
            ).tr(),
            horizontalSpace(4),
            Text(
              'egp',
              style: TextStyles.font12MadaRegularBlack
                  .copyWith(color: ColorManger.red),
            ).tr()
          ],
        ),
      ),
    );
  }
}