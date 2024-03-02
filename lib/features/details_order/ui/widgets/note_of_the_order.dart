import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/features/details_order/ui/widgets/row_of_note_of_the_order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';

class NotesOfTheOrder extends StatelessWidget {
  const NotesOfTheOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManger.red.withOpacity(.05),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: SvgPicture.asset(AppIcons.idIcon),
                ),
                horizontalSpace(8),
                Text(
                  'num',
                  style: TextStyles.font18MadaSemiBoldBlack.copyWith(
                    color: ColorManger.red,
                  ),
                ).tr()
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: SvgPicture.asset(AppIcons.calenderRedIcon),
                ),
                horizontalSpace(8),
                Row(
                  children: [
                    Text(
                      'date',
                      style: TextStyles.font14MadaRegularBlack,
                    ).tr(),
                    horizontalSpace(8),
                    Text(
                      '-',
                      style: TextStyles.font14MadaRegularBlack,
                    ),
                    horizontalSpace(8),
                    Text(
                      'time',
                      style: TextStyles.font14MadaRegularBlack,
                    ).tr(),
                  ],
                ),
              ],
            ),
            verticalSpace(20),
            RowOfNoteOfTheOrder(
              icon: AppIcons.restBranchIcon,
              title: 'branch',
              primTitle: 'address',
            ),
            verticalSpace(20),
            RowOfNoteOfTheOrder(
              icon: AppIcons.locationIcon,
              title: 'delivery_address',
              primTitle: 'address',
            ),
            verticalSpace(20),
            RowOfNoteOfTheOrder(
              icon: AppIcons.payIcon,
              title: 'payment_method',
              primTitle: 'cash',
            ),
            verticalSpace(20),
            RowOfNoteOfTheOrder(
              icon: AppIcons.notesIcon,
              title: 'comments',
              primTitle: 'Bring fresh shrimp',
            ),
          ],
        ),
      ),
    );
  }
}
