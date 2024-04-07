import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/features/favorite/ui/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../main.dart';
import '../../../orders/ui/my_orders_screen.dart';
import '../../../points/ui/points_screen.dart';
import '../../../sign_in/ui/sign_in.dart';
import 'container_of_row_of_setting.dart';

class RowOfSetting extends StatelessWidget {
  const RowOfSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 121.h,
      decoration: BoxDecoration(
        color: ColorManger.grayMoreLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerOfRowOfSetting(
              onTap: () {
                if (saveUserData.getUserToken() == '') {
                  push(const SigninScreen());
                } else {
                  push(const MyOrdersScreen(
                    check: false,
                  ));
                }
              },
              text: 'my_orders',
              image: AppIcons.ordersIcon,
            ),
            ContainerOfRowOfSetting(
              onTap: () {
                if (saveUserData.getUserToken() == '') {
                  push(const SigninScreen());
                } else {
                  push(const FavoriteScreen());
                }
              },
              text: 'favorite',
              image: AppIcons.favoritesIcon,
            ),
            ContainerOfRowOfSetting(
              onTap: () {
                if (saveUserData.getUserToken() == '') {
                  push(const SigninScreen());
                } else {
                  push(const PointsScreen());
                }
              },
              text: 'points',
              image: AppIcons.pointsIcon,
            )
          ],
        ),
      ),
    );
  }
}
