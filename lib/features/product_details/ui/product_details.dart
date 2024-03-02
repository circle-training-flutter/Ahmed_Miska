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

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      verticalSpace(12),
                      const ContainerOfImage(),
                      verticalSpace(12),
                      const RowOfNameAndfavorite(),
                      verticalSpace(12),
                      const ProductDescription(),
                      verticalSpace(12),
                      const TotalAmount(),
                      verticalSpace(50),
                    ],
                  ),
                ),
              ),
            ),
            TotalPrice(
              buttom: const AddToCartTextAndIconRow(),
              onTap: () {
                push(const CartScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
