import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/cart/ui/cart_screen.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:circletraning/features/product_details/ui/widgets/add_to_cart_text_and_icon_row.dart';
import 'package:circletraning/features/product_details/ui/widgets/container_of_image.dart';
import 'package:circletraning/features/product_details/ui/widgets/product_descreption.dart';
import 'package:circletraning/features/product_details/ui/widgets/row_of_name_and_favorite.dart';
import 'package:circletraning/features/product_details/ui/widgets/total_amount.dart';
import 'package:circletraning/features/product_details/ui/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/response/product_model/product_datum.dart';
import '../../../data/providers/shared_prefrance_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModelItem product;
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  SharedPref sharedPref = getIt();
  @override
  void initState() {
    widget.product.weightUnit = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductModelItem product = widget.product;
    final dynamic totalPrice = (product.price! * product.weightUnit!);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'product_details'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(12),
                      ContainerOfImage(
                        imageUrl: product.image!,
                      ),
                      verticalSpace(12),
                      RowOfNameAndfavorite(
                        title: product.title!,
                      ),
                      verticalSpace(12),
                      SizedBox(
                        height: 170.h,
                        child: ProductDescription(
                          description: product.details!,
                        ),
                      ),
                      verticalSpace(12),
                      TotalAmount(
                        product: product,
                        productTotalPrice: (dynamic producttotalPrice) {
                          setState(() {
                            producttotalPrice = totalPrice;
                          });
                        },
                      ),
                      verticalSpace(50),
                    ],
                  ),
                ),
              ),
            ),
            TotalPrice(
              price: totalPrice,
              buttom: const AddToCartTextAndIconRow(),
              onTap: () {
                sharedPref.addToCart(product, context);
                pushReplacement(const CartScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
