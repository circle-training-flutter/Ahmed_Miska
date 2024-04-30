import 'package:circletraning/data/models/response/product_model/product_datum.dart';
import 'package:circletraning/features/details_order/ui/widgets/row_of_product_in_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewOfProductsInProductDetails extends StatelessWidget {
  final List<ProductModelItem> productItems;
  const ListViewOfProductsInProductDetails({
    super.key, required this.productItems,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: RowOfProductsInProductDetails(
              product: productItems[index],
            ),
          );
        },
      ),
    );
  }
}
