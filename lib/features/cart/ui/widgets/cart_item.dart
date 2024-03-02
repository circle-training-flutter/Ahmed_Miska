
import 'package:circletraning/features/cart/ui/widgets/total_price_of_item_in_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import 'counter_in_cart_item.dart';
import 'first_row_in_cart_item.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 24.h,
      ),
      child: SizedBox(
        height: 147.67.h,
        width: double.infinity,
        child: Column(
          children: [
            const FirstRowInCartItem(),
            verticalSpace(12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  CounterInCartItem(),
                   TotalPriceOfItemInCartItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
