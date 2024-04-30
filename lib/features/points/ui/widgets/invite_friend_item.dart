import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class InviteFriendItem extends StatelessWidget {
  final String fname, lname;
  final num number;
  const InviteFriendItem({
    super.key,
    required this.fname,
    required this.number,
    required this.lname,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SVGIcon(AppIcons.pointsIcon),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'you_invite',
              style: TextStyles.font10MadaRegularBlack.copyWith(
                color: ColorManger.gray,
              ),
            ).tr(),
            verticalSpace(4),
            Text(
              '$fname  $lname',
              style: TextStyles.font14MadaRegularBlack,
            ).tr()
          ],
        ),
        const Spacer(),
        Text(
          "+ $number",
          style: TextStyles.font18MadaSemiBoldBlack.copyWith(color: ColorManger.red),
        )
      ],
    );
  }
}
