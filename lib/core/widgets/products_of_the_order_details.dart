import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../features/bill/ui/widgets/use_points_continer.dart';
import '../../data/providers/shared_prefrance_provider.dart';
import '../helpers/spacing.dart';
import '../theming/colors.dart';
import 'dashed_divider.dart';
import '../../features/details_order/ui/widgets/listview_od_products_in_product_screen.dart';

class ProductsOfTheOrderDetails extends StatelessWidget {
  final bool usePoints;
  const ProductsOfTheOrderDetails({
    super.key,
    required this.usePoints,
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
            MySeparator(color: ColorManger.gray.withOpacity(.3)),
            verticalSpace(12),
            const OrderRow(),
            verticalSpace(12),
            MySeparator(color: ColorManger.gray.withOpacity(.3)),
            verticalSpace(12),
            usePoints ? const UsePointsContainer() : horizontalSpace(1),
            const TotalPriceRow()
          ],
        ),
      ),
    );
  }
}

class TotalPriceRow extends StatelessWidget {
  const TotalPriceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'total',
          style: TextStyles.font14MadaSemiBoldBlack,
        ).tr(),
        const Spacer(),
        Consumer<SharedPref>(builder: (context, sharedPref, child) {
          return Text(
            sharedPref.totalPrice().toString(),
            style: TextStyles.font18MadaSemiBoldBlack
                .copyWith(color: ColorManger.red),
          ).tr();
        }),
        horizontalSpace(4),
        Text(
          'egp',
          style:
              TextStyles.font12MadaRegularGray.copyWith(color: ColorManger.red),
        ).tr()
      ],
    );
  }
}

class OrderRow extends StatelessWidget {
  const OrderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'delivery',
          style: TextStyles.font12MadaRegularBlack,
        ).tr(),
        const Spacer(),
        Text(
          'price',
          style: TextStyles.font16MadaSemiBoldBlack,
        ).tr(),
        horizontalSpace(4),
        Text(
          'egp',
          style: TextStyles.font12MadaRegularGray,
        ).tr()
      ],
    );
  }
}