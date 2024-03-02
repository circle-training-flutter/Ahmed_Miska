import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item.dart';

class CategoryGridview extends StatelessWidget {
  const CategoryGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: (142.h + 4.h) * ceil(8,4),
      // width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 82.75.w / 142.h,
            crossAxisSpacing: 4.w,
            mainAxisSpacing: 4.h,
          ),
          itemBuilder: (context, index) {
            return const CategoryItem();
          },
        ),
      ),
    );
  }
}
