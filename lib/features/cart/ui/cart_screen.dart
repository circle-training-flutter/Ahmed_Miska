import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/features/cart/ui/widgets/cart_item.dart';
import 'package:circletraning/features/pay_and_delevary/ui/pay_and_delevary_screen.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:circletraning/features/sign_in/ui/sign_in.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/shared_prefrance_provider.dart';
import '../../../main.dart';
import '../../product_details/ui/widgets/total_price.dart';

// GetIt getIt = GetIt.instance;

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SharedPref>(builder: (context, sharedPref, child) {
          return Column(
            children: [
              const AppBarOfReturnedScreens(
                title: 'basket',
                check: true,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: sharedPref.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      onTap: () {
                        sharedPref.removeFromCart(sharedPref.cartItems[index]);
                      },
                      product: sharedPref.cartItems[index],
                    );
                  },
                ),
              ),
              TotalPrice(
                buttom: Text(
                  'order_now',
                  style: TextStyles.font14MadaRegularWith,
                ).tr(),
                onTap: () {
                  if (sharedPref.cartItems.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'your_cart_is_empty'.tr(),
                    );
                  } else if (saveUserData.getUserToken().isEmpty) {
                    push(const SigninScreen());
                  } else {
                    push(PayAndDelevaryScreen(
                      price: sharedPref.totalPrice().toInt(),
                    ));
                  }
                },
                price: sharedPref.totalPrice().toInt(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
