import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/widgets/cached_network_image.dart';
import 'package:circletraning/data/models/response/category_model/cat_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../../product/ui/products_screen.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final CatItem categoryModel;
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(ProductsScreen(
          index: index,
        ));
      },
      child: Container(
        // height: 142.h,
        // width: 82.75.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Container(
                height: 80.h,
                width: 80.h,
                decoration: BoxDecoration(
                  color: ColorManger.grayMoreLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorManger.white,
                    ),
                    child: CachedImage(image: categoryModel.image.toString())),
              ),
            ),
            verticalSpace(10),
            Text(
              categoryModel.title.toString(),
              style: TextStyles.font12MadaRegularBlack,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).tr()
          ],
        ),
      ),
    );
  }
}
