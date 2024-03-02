import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class RowOfSetSettings extends StatelessWidget {
  final String text;
  final String icon;
  final Function()? onTap;
  const RowOfSetSettings({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
            width: 20.h,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.fill,
            ),
          ),
          horizontalSpace(12),
          Text(
            text,
            style: TextStyles.font14MadaRegularBlack,
          ).tr(),
          const Spacer(),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
