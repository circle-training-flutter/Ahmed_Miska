import 'package:circletraning/core/theming/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_red_buttom.dart';

class TotalPrice extends StatelessWidget {
  final int price;
  final Widget buttom;
  final Function() onTap;
  const TotalPrice({
    super.key,
    required this.buttom,
    required this.onTap,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        color: ColorManger.white,
        boxShadow: [
          BoxShadow(
            color: ColorManger.gray.withOpacity(.2),
            offset: const Offset(0, -7),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Text(
              'total',
              style: TextStyles.font12MadaRegularBlack,
            ).tr(),
            horizontalSpace(4),
            Text(
              price.toString(),
              style: TextStyles.font18MadaSemiBoldBlack,
            ).tr(),
            horizontalSpace(4),
            Text(
              'egp',
              style: TextStyles.font12MadaRegularBlack,
            ).tr(),
            const Spacer(),
            CustomRedButtom(
              onTap: onTap,
              child: buttom,
            )
          ],
        ),
      ),
    );
  }
}
