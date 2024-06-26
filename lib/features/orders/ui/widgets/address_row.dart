import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AddressRow extends StatelessWidget {
  final String address;
  const AddressRow({
    super.key, required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SVGIcon(
          AppIcons.pinIcon,
          height: 21.h,
          width: 21.w,
          color: ColorManger.black,
        ),
        horizontalSpace(8),
        Text(
          address,
          style: TextStyles.font14MadaRegularBlack,
        ).tr()
      ],
    );
  }
}
