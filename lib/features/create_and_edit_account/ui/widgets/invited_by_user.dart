import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_check_box.dart';

class InvitedByUser extends StatelessWidget {
  const InvitedByUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CustomCheckBox(),
            horizontalSpace(8),
            Text(
              'invited_by_user',
              style: TextStyles.font14MadaRegularBlack,
            ).tr()
          ],
        ),
      ],
    );
  }
}
