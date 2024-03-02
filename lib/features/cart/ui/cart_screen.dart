import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/features/cart/ui/widgets/cart_item.dart';
import 'package:circletraning/features/pay_and_delevary/ui/pay_and_delevary_screen.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../product_details/ui/widgets/total_price.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'basket'),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CartItem();
                  }),
            ),
            TotalPrice(
              buttom: Text(
                'order_now',
                style: TextStyles.font14MadaRegularWith,
              ).tr(),
              onTap: () {
                push(const PayAndDelevaryScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
