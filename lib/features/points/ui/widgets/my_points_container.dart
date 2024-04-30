import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class MyPointsContianer extends StatelessWidget {
  final num points;
  const MyPointsContianer({
    super.key, required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 240.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.pointsGIF),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SVGIcon(
                AppIcons.pointsIcon,
                height: 32.h,
                width: 32.h,
              ),
              horizontalSpace(8),
              Text(
                'my_points',
                style: TextStyles.font16MadaSemiBoldBlack.copyWith(color: ColorManger.gray),
              ).tr()
            ],
          ),
          Text(
           points.toString() ,
            style: TextStyles.font18MadaSemiBoldBlack.copyWith(fontSize: 60.sp),
          ),
        ],
      ),
    );
  }
}
