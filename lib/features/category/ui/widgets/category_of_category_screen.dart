import 'package:circletraning/core/widgets/cached_network_image.dart';
import 'package:circletraning/data/models/response/category_model/cat_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CategoryOfCatScreen extends StatelessWidget {
  final CatItem categoryModel;
  final bool isSelected;
  const CategoryOfCatScreen({
    super.key,
    required this.isSelected,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 110.h,
      // width: 78.w,
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: ColorManger.red.withOpacity(.05),
              border: Border.all(
                color: ColorManger.red,
              ),
            )
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 48.h,
              width: 48.h,
              child: Container(
                  decoration: BoxDecoration(
                    color: ColorManger.grayMoreLight,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CachedImage(image: categoryModel.image.toString())),
            ),
            verticalSpace(10),
            Text(
              categoryModel.title.toString(),
              style: TextStyles.font12MadaRegularBlack,
              textAlign: TextAlign.center,
            ).tr(),
            verticalSpace(8)
          ],
        ),
      ),
    );
  }
}
