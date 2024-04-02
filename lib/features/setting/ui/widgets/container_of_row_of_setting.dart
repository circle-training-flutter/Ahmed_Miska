import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class ContainerOfRowOfSetting extends StatelessWidget {
  final String text;
  final String image;
  final Function() onTap;
  const ContainerOfRowOfSetting({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: SizedBox(
          width: 103.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SVGIcon(
                image,
                height: 48.h,
                width: 48.h,
              ),
              verticalSpace(12),
              Text(
                text,
                style: TextStyles.font16MadaSemiBoldBlack,
              ).tr()
            ],
          ),
        ),
      ),
    );
  }
}
