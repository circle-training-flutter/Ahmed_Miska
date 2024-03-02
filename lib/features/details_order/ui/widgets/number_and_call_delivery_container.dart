import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NumberAndCallDeliveryContainer extends StatelessWidget {
  const NumberAndCallDeliveryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: AssetImage(
                    Assets.profile,
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.red,
              ),
            ),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'name',
                  style: TextStyles.font14MadaRegularBlack,
                ).tr(),
                verticalSpace(4),
                Text(
                  'call_number',
                  style: TextStyles.font14MadaRegularBlack.copyWith(
                    color: ColorManger.gray,
                  ),
                ).tr()
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(AppIcons.callIcon),
            )
          ],
        ),
      ),
    );
  }
}
