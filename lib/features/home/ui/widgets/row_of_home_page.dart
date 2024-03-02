import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class RowOfHomePage extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const RowOfHomePage({
    super.key,
    required this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyles.font18MadaSemiBoldBlack,
          ).tr(),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'view_all',
              style: TextStyles.font12MadaRegularRed,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
