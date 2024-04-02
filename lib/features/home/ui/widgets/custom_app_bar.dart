import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/providers/shared_prefrance_provider.dart';
import 'package:circletraning/data/providers/slider_image_provider.dart';
import 'package:circletraning/features/cart/ui/cart_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../notification/ui/notification_screen.dart';
import 'app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 72.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            SVGIcon(Assets.logo, height: 22.h, width: 32.w),
            horizontalSpace(8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('hello', style: TextStyles.font12MadaRegularGray).tr(),
                Text('name', style: TextStyles.font16MadaSemiBoldBlack).tr(),
              ],
            ),
            const Spacer(),
            Consumer<SliderImageProvider>(
              builder: (context, provider, child) {
                return GestureDetector(
                  onTap: () {
                    push(const NotificationScreen());
                  },
                  child: AppBarIcon(
                    icon: AppIcons.notificationIcon,
                    check: provider.notificationCount != 0 ? true : false,
                  ),
                );
              },
            ),
            horizontalSpace(8),
            Consumer<SharedPref>(
              builder: (context, provider, child) {
                return GestureDetector(
                  onTap: () {
                    push(const CartScreen());
                  },
                  child: AppBarIcon(
                    icon: AppIcons.cartIcon,
                    check: provider.cartItems.isEmpty ? false : true,
                    number: provider.totalquantity().toInt(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
