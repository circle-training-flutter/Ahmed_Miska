import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/colors.dart';

class PayWayItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  const PayWayItem({
    super.key,
    required this.isSelected, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color:
              isSelected ? ColorManger.red.withOpacity(.05) : ColorManger.white,
          border: Border.all(
            color: isSelected ? ColorManger.red : ColorManger.white,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyles.font14MadaRegularBlack,
              ).tr(),
              const Spacer(),
              SVGIcon(
                AppIcons.cashIcon,
                height: 16.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
