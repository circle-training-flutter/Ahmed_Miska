import 'package:circletraning/features/cart/ui/widgets/total_price_of_item_in_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../data/models/response/product_model/product_datum.dart';
import 'counter_in_cart_item.dart';
import 'first_row_in_cart_item.dart';

class CartItem extends StatelessWidget {
  final ProductModelItem product;
  final Function()? onTap;

  const CartItem({
    super.key,
    this.onTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 24.h,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            FirstRowInCartItem(
              onTap: onTap,
              product: product,
            ),
            verticalSpace(12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CounterInCartItem(
                    product: product,
                  ),
                  TotalPriceOfItemInCartItem(
                    product: product,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
