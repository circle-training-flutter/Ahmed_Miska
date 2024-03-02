import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/colors.dart';
import 'container_of_row_of_setting.dart';

class RowOfSetting extends StatelessWidget {
  const RowOfSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 121.h,
      decoration: BoxDecoration(
        color: ColorManger.grayMoreLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerOfRowOfSetting(
              text: 'my_orders',
              image: AppIcons.ordersIcon,
            ),
            ContainerOfRowOfSetting(
              text: 'favorite',
              image: AppIcons.favoritesIcon,
            ),
            ContainerOfRowOfSetting(
              text: 'points',
              image: AppIcons.pointsIcon,
            )
          ],
        ),
      ),
    );
  }
}
