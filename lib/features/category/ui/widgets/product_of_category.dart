
import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class ProductOfCategory extends StatelessWidget {
  const ProductOfCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      decoration: BoxDecoration(
        color: ColorManger.grayMoreLight,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 12.w, vertical: 12.h),
        child: Text(
          'meat_and_poultry',
          style: TextStyles.font12MadaRegularBlack,
        ).tr(),
      ),
    );
  }
}