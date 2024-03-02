import 'package:circletraning/features/details_order/ui/widgets/row_of_product_in_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewOfProductsInProductDetails extends StatelessWidget {
  const ListViewOfProductsInProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: const RowOfProductsInProductDetails(),
          );
        },
      ),
    );
  }
}
