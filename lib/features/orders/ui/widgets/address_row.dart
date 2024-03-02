
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 21.h,
          width: 21.w,
          child: SvgPicture.asset(
            AppIcons.pinIcon,
            color: ColorManger.black,
          ),
        ),
        horizontalSpace(8),
        Text(
          'address',
          style: TextStyles.font14MadaRegularBlack,
        ).tr()
      ],
    );
  }
}
