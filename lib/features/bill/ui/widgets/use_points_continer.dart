import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_check_box.dart';
import '../../../../core/widgets/dashed_divider.dart';

class UsePointsContainer extends StatelessWidget {
  const UsePointsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
             CustomCheckBox(onProductSelected: (bool check) {  },),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'use_points',
                  style: TextStyles.font12MadaRegularGray,
                ).tr(),
                Row(
                  children: [
                    Text(
                      '( ${tr('130')} )',
                      style: TextStyles.font14MadaSemiBoldBlack,
                    ),
                    horizontalSpace(4),
                    Text(
                      'point',
                      style: TextStyles.font10MadaRegularBlack,
                    ).tr()
                  ],
                )
              ],
            ),
            const Spacer(),
            Text(
              '- ${tr('130')}',
              style: TextStyles.font16MadaSemiBoldBlack,
            ),
            horizontalSpace(4),
            Text(
              'egp',
              style: TextStyles.font12MadaRegularGray,
            ).tr()
          ],
        ),
        verticalSpace(12),
        MySeparator(color: ColorManger.gray.withOpacity(.3)),
        verticalSpace(12),
      ],
    );
  }
}
