import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/functions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/search_bar.dart';
import 'choose_city_buttom_sheet.dart';

class SearchAndChoseCity extends StatelessWidget {
  const SearchAndChoseCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 54.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                displayBottomSheet(context, const ChooseCityButtomSheet());
              },
              child: Container(
                // height: 54.h,
                // width: 111.w,
                decoration: BoxDecoration(
                  color: ColorManger.red,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SVGIcon(AppIcons.pinIcon, height: 16.h, width: 16.h),
                      Text(
                        'city',
                        style: TextStyles.font14MadaRegularWith,
                      ).tr(),
                      Icon(
                        Icons.expand_more,
                        color: ColorManger.white,
                        size: 24.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            horizontalSpace(10),
            const SearchBaar()
          ],
        ),
      ),
    );
  }
}
