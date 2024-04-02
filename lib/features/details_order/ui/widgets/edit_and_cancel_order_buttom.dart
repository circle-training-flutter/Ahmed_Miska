import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class EditAndCancelOrderButtom extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  const EditAndCancelOrderButtom({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 143.5.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SVGIcon(icon),
          horizontalSpace(8),
          Text(
            title,
            style: TextStyles.font12MadaRegularRed.copyWith(color: color),
          ).tr()
        ],
      ),
    );
  }
}
