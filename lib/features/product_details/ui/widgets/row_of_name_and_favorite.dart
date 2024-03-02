

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/heart_icon.dart';

class RowOfNameAndfavorite extends StatelessWidget {
  const RowOfNameAndfavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'salmon',
          style: TextStyles.font18MadaSemiBoldBlack
              .copyWith(color: ColorManger.red),
        ).tr(),
        const Spacer(),
        const HeartIcon(),
      ],
    );
  }
}