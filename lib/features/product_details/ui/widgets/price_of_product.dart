import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';

class PriceOfProduct extends StatelessWidget {
  final int price;
  const PriceOfProduct({
    super.key,
    required this.price,
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
            SVGIcon(AppIcons.priceIcon),
            horizontalSpace(8),
            Text(
              'price_text',
              style: TextStyles.font14MadaRegularBlack,
            ).tr(),
            const Spacer(),
            Text(
              price.toString(),
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
