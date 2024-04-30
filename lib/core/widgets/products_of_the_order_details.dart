import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/data/models/response/product_model/product_datum.dart';
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

class ProductsOfTheOrderDetails extends StatefulWidget {
  final num totalPrice;
  final num deliveryPrice;
  final List<ProductModelItem> productItems;
  final bool usePoints;
  final Function(bool) onTab;
  const ProductsOfTheOrderDetails({
    super.key,
    required this.usePoints,
    required this.onTab,
    required this.productItems,
    required this.totalPrice, required this.deliveryPrice,
  });

  @override
  State<ProductsOfTheOrderDetails> createState() => _ProductsOfTheOrderDetailsState();
}

class _ProductsOfTheOrderDetailsState extends State<ProductsOfTheOrderDetails> {
  bool useboint = false;

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
            ListViewOfProductsInProductDetails(productItems: widget.productItems),
            verticalSpace(12),
            MySeparator(color: ColorManger.gray.withOpacity(.3)),
            verticalSpace(12),
            OrderRow(
              deliveryPrice: widget.deliveryPrice,
            ),
            verticalSpace(12),
            MySeparator(color: ColorManger.gray.withOpacity(.3)),
            verticalSpace(12),
            widget.usePoints
                ? UsePointsContainer(
                    // ignore: avoid_types_as_parameter_names
                    onTab: (bool) {
                      widget.onTab(bool);
                      setState(() {
                        useboint = bool;
                      });
                    },
                  )
                : horizontalSpace(1),
            TotalPriceRow(
              totalPrice: widget.totalPrice,
            )
          ],
        ),
      ),
    );
  }
}

class TotalPriceRow extends StatelessWidget {
  final num totalPrice;

  const TotalPriceRow({
    super.key,
    required this.totalPrice,
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
            totalPrice.toString(),
            style: TextStyles.font18MadaSemiBoldBlack.copyWith(color: ColorManger.red),
          ).tr();
        }),
        horizontalSpace(4),
        Text(
          'egp',
          style: TextStyles.font12MadaRegularGray.copyWith(color: ColorManger.red),
        ).tr()
      ],
    );
  }
}

class OrderRow extends StatelessWidget {
  final num deliveryPrice;
  const OrderRow({
    super.key,
    required this.deliveryPrice,
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
          deliveryPrice.toString(),
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
