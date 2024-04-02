import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/svg_icon.dart';

class SelectCountryContainer extends StatelessWidget {
  const SelectCountryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorManger.grayMoreLight,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            SVGIcon(
              AppIcons.flagIcon,
              height: 32.h,
              width: 48.w,
            ),
            horizontalSpace(12),
            Text(
              'egypt',
              style: TextStyles.font14MadaRegularBlack,
            ).tr(),
            const Spacer(),
            Icon(
              Icons.expand_more_outlined,
              size: 20.sp,
              color: ColorManger.red,
            )
          ],
        ),
      ),
    );
  }
}
