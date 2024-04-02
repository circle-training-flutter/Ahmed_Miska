import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class AddToCartTextAndIconRow extends StatelessWidget {
  const AddToCartTextAndIconRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SVGIcon(
          AppIcons.addCartIcon,
          height: 20.h,
          width: 20.w,
        ),
        horizontalSpace(4),
        Text(
          'add_to_cart',
          style: TextStyles.font14MadaRegularWith,
        ).tr(),
      ],
    );
  }
}
