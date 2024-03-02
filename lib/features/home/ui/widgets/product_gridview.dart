import 'package:circletraning/features/home/ui/widgets/product_gridview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridview extends StatelessWidget {
  const ProductGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: (191.33.h + 12.h) * ceil(8,2),
      // width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 167.5.w / 191.33.h,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 12.h,
          ),
          itemBuilder: (context, index) {
            return const ProductGridviewItem();
          },
        ),
      ),
    );
  }
}
