import 'package:circletraning/data/models/response/sub_category_model/sub_cat_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ItemOfCategoryProuduct extends StatelessWidget {
  final SubCategoryItem item;
  final bool isSelected;

  const ItemOfCategoryProuduct({
    super.key,
    required this.isSelected,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: isSelected ? ColorManger.red : ColorManger.grayMoreLight),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          child: Text(
            item.title!,
            style: TextStyles.font12MadaRegularBlack.copyWith(
                color: isSelected ? ColorManger.white : ColorManger.black),
          ).tr(),
        ),
      ),
    );
  }
}
