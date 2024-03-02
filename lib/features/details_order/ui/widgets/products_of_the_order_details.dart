import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import 'listview_od_products_in_product_screen.dart';

class ProductsOfTheOrderDetails extends StatelessWidget {
  const ProductsOfTheOrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManger.grayLight,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Products',
              style: TextStyles.font12MadaRegularGray,
            ).tr(),
            verticalSpace(12),
            const ListViewOfProductsInProductDetails(),
            verticalSpace(12),
            Row(
              children: [
                Text(
                  'delivery',
                  style: TextStyles.font12MadaRegularBlack,
                ).tr(),
                const Spacer(),
                Text(
                  'price',
                  style: TextStyles.font16MadaRegularBlack,
                ).tr(),
                horizontalSpace(4),
                Text(
                  'egp',
                  style: TextStyles.font12MadaRegularGray,
                ).tr()
              ],
            ),
            verticalSpace(16),
            Row(
              children: [
                Text(
                  'total',
                  style: TextStyles.font16MadaRegularBlack,
                ).tr(),
                const Spacer(),
                Text(
                  'price',
                  style: TextStyles.font18MadaSemiBoldBlack
                      .copyWith(color: ColorManger.red),
                ).tr(),
                horizontalSpace(4),
                Text(
                  'egp',
                  style: TextStyles.font12MadaRegularGray
                      .copyWith(color: ColorManger.red),
                ).tr()
              ],
            )
          ],
        ),
      ),
    );
  }
}
