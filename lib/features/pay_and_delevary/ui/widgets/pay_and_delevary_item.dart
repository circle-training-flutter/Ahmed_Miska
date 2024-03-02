import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayAndDelevaryItem extends StatelessWidget {
  const PayAndDelevaryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 48.h,
          width: 72.w,
          child: Image.asset(Assets.pic3),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'salmon',
                style: TextStyles.font14MadaRegularBlack,
              ).tr(),
              verticalSpace(8),
              Row(
                children: [
                  Text(
                    'x',
                    style: TextStyles.font12MadaRegularRed,
                  ),
                  horizontalSpace(4),
                  Text(
                    '2',
                    style: TextStyles.font14MadaRegularBlack
                        .copyWith(color: ColorManger.red),
                  ),
                  const Spacer(),
                  Text(
                    'total',
                    style: TextStyles.font12MadaRegularBlack,
                  ).tr(),
                  horizontalSpace(4),
                  Text(
                    'price',
                    style: TextStyles.font18MadaSemiBoldBlack
                        .copyWith(color: ColorManger.red),
                  ).tr(),
                  horizontalSpace(4),
                  Text(
                    'egp',
                    style: TextStyles.font12MadaRegularRed,
                  ).tr()
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
