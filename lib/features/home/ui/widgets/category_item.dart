import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/styles.dart';
import '../../../product/ui/products_screen.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    super.key,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(const ProductsScreen());
      },
      child: Container(
        height: 142.h,
        width: 82.75.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: ColorManger.grayMoreLight,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(Assets.pic2),
                    scale: .9,
                  ),
                ),
              ),
            ),
            verticalSpace(10),
            Text(
              'category_item',
              style: TextStyles.font12MadaRegularBlack,
              textAlign: TextAlign.center,
            ).tr()
          ],
        ),
      ),
    );
  }
}
