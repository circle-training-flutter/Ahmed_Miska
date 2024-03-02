
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class TotalPriceOfItemInCartItem extends StatelessWidget {
  const TotalPriceOfItemInCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          'total',
          style:
              TextStyles.font12MadaRegularBlack,
        ).tr(),
        verticalSpace(4),
        Row(
          children: [
            Text(
              'price',
              style: TextStyles
                  .font18MadaSemiBoldBlack
                  .copyWith(
                color: ColorManger.red,
              ),
            ).tr(),
            horizontalSpace(4),
            Text(
              'egp',
              style: TextStyles
                  .font12MadaRegularBlack
                  .copyWith(
                color: ColorManger.red,
              ),
            ).tr()
          ],
        )
      ],
    );
  }
}
