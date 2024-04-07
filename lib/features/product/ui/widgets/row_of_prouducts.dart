import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class AppBarOfReturnedScreens extends StatelessWidget {
  final String title;
  final bool? check;
  final void Function()? onTap;
  const AppBarOfReturnedScreens({
    super.key,
    required this.title,
    this.check, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap ?? () {
                check == true ? pushAndRemoveUntil(const MainScreen()) : pop();
              },
              child: SVGIcon(
                AppIcons.arrowBackIcon,
                height: 14.4.h,
                width: 19.8.w,
              ),
            ),
            horizontalSpace(18),
            Text(
              title,
              style: TextStyles.font18MadaSemiBoldBlack,
            ).tr(),
          ],
        ),
      ),
    );
  }
}
