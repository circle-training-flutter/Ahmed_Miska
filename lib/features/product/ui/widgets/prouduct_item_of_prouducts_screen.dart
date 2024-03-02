import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ProuductItemofProuductsScreen extends StatelessWidget {
  final bool isSelected;
  const ProuductItemofProuductsScreen({
    super.key, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Container(
        height: 40.h,
        width: 129.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border:isSelected? Border.all(color: ColorManger.red, width: 1.w):null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: Image.asset(Assets.pic2),
            ),
            horizontalSpace(4),
            Text(
              'category_item',
              style: TextStyles.font12MadaRegularBlack,
            ).tr()
          ],
        ),
      ),
    );
  }
}
