
import 'package:circletraning/core/helpers/consatants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class CategoryocCatScreen extends StatelessWidget {
  const CategoryocCatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: 78.w,
      child: Column(
        children: [
          Image.asset(Assets.pic2),
          verticalSpace(10),
          Text(
            'category_item',
            style: TextStyles.font12MadaRegularBlack,
          ).tr(),
        ],
      ),
    );
  }
}
