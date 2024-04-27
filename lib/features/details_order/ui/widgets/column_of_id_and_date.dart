import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/svg_icon.dart';

class ColumnOfIdAndDateOfTheNotesOfOrder extends StatelessWidget {
  final DateTime date;
  final String time;
  final int id;
  const ColumnOfIdAndDateOfTheNotesOfOrder({
    super.key,
    required this.date,
    required this.time, required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SVGIcon(AppIcons.idIcon),
            horizontalSpace(8),
            Text(
              '#$id',
              style: TextStyles.font18MadaSemiBoldBlack.copyWith(
                color: ColorManger.red,
              ),
            ).tr()
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            SVGIcon(AppIcons.calenderRedIcon),
            horizontalSpace(8),
            Row(
              children: [
                Text(
                  date.toString().substring(0, 10),
                  style: TextStyles.font14MadaRegularBlack,
                ).tr(),
                horizontalSpace(8),
                Text(
                  '-',
                  style: TextStyles.font14MadaRegularBlack,
                ),
                horizontalSpace(8),
                Text(
                  time,
                  style: TextStyles.font14MadaRegularBlack,
                ).tr(),
              ],
            ),
          ],
        ),
        verticalSpace(20),
      ],
    );
  }
}
