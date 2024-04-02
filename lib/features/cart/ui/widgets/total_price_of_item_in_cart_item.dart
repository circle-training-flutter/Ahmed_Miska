import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/response/product_model/product_datum.dart';
import '../../../../data/providers/shared_prefrance_provider.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class TotalPriceOfItemInCartItem extends StatelessWidget {
  final ProductModelItem product;
  const TotalPriceOfItemInCartItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'total',
          style: TextStyles.font12MadaRegularBlack,
        ).tr(),
        verticalSpace(4),
        Row(
          children: [
            Consumer<SharedPref>(
              builder: (context, sharedPref, child) {
                return Text(
                  sharedPref.totalProductPrice(product).toString(),
                  style: TextStyles.font18MadaSemiBoldBlack.copyWith(
                    color: ColorManger.red,
                  ),
                ).tr();
              },
            ),
            horizontalSpace(4),
            Text(
              'egp',
              style: TextStyles.font12MadaRegularBlack.copyWith(
                color: ColorManger.red,
              ),
            ).tr()
          ],
        )
      ],
    );
  }
}
