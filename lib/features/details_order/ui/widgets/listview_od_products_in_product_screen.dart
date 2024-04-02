import 'package:circletraning/features/details_order/ui/widgets/row_of_product_in_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../data/providers/shared_prefrance_provider.dart';

class ListViewOfProductsInProductDetails extends StatelessWidget {
  const ListViewOfProductsInProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedPref>(builder: (context, sharedPref, child) {
      return SizedBox(
        width: double.infinity,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sharedPref.cartItems.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: RowOfProductsInProductDetails(
                product: sharedPref.cartItems[index],
              ),
            );
          },
        ),
      );
    });
  }
}
