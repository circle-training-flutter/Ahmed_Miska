import 'package:circletraning/core/theming/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/styles.dart';

class SearchBaar extends StatelessWidget {
  const SearchBaar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.grayLight,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            horizontalSpace(9),
            Icon(
              Icons.search,
              color: ColorManger.red,
              size: 20.sp,
            ),
            horizontalSpace(8),
            Text(
              'search',
              style: TextStyles.font12MadaRegularGray,
            ).tr(),
          ],
        ),
      ),
    );
  }
}
