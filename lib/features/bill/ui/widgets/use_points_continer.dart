import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/data/providers/calculate_order_cost_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_check_box.dart';
import '../../../../core/widgets/dashed_divider.dart';

class UsePointsContainer extends StatelessWidget {
  final void Function(bool) onTab;
  const UsePointsContainer({
    super.key,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomCheckBox(
              onProductSelected: (bool check) {
                onTab(check);
              },
            ),
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
                      '( ${Provider.of<CalculateOrderCostProvider>(context, listen: false).orderCostModel!.data!.totalPoints!.abs()} )',
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
              Provider.of<CalculateOrderCostProvider>(context, listen: false).orderCostModel!.data!.points!.toString(),
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
