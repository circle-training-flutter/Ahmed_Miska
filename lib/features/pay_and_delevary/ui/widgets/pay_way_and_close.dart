import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/svg_icon.dart';

class PayWayAndClose extends StatelessWidget {
  const PayWayAndClose({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'pay_method',
          style: TextStyles.font18MadaSemiBoldBlack,
        ).tr(),
        const Spacer(),
        IconButton(
          icon: SVGIcon(AppIcons.closeIcon),
          onPressed: () {
            pop();
          },
        )
      ],
    );
  }
}
