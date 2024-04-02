import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'about_app'),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SVGIcon(
                    AppIcons.logoAndNameIcon,
                    height: 120.h,
                    width: 134.w,
                  ),
                  verticalSpace(32),
                  Row(
                    children: [
                      SVGIcon(
                        AppIcons.aboutRecIcon,
                        height: 33.h,
                        width: 13.w,
                      ),
                      horizontalSpace(8),
                      Text(
                        'who_are_we',
                        style: TextStyles.font18MadaSemiBoldBlack,
                      ).tr(),
                    ],
                  ),
                  verticalSpace(24),
                  Text(
                    'about',
                    style: TextStyles.font14MadaRegularBlack
                        .copyWith(color: ColorManger.gray),
                    textAlign: TextAlign.start,
                  ).tr()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
