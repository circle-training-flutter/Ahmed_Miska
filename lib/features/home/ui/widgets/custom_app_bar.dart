import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/features/cart/ui/cart_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            SvgPicture.asset(Assets.logo, height: 22.h, width: 32.w),
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
            const AppBarIcon(icon: Icons.notifications),
            horizontalSpace(8),
            GestureDetector(
                onTap: () {
                  push(const CartScreen());
                },
                child: const AppBarIcon(icon: Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
