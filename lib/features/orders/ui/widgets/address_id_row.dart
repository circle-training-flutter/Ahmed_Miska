import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AddressIdRow extends StatelessWidget {
  final int id;
  const AddressIdRow({
    super.key, required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Text(
            '#$id',
            style: TextStyles.font18MadaSemiBoldBlack.copyWith(color: ColorManger.red),
          ).tr(),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: Text(
            'details',
            style: TextStyles.font14MadaRegularBlack.copyWith(color: ColorManger.red),
          ).tr(),
        )
      ],
    );
  }
}
