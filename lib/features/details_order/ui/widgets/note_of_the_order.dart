import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/details_order/ui/widgets/row_of_note_of_the_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import 'column_of_id_and_date.dart';

class NotesOfTheOrder extends StatelessWidget {
  final bool? check;
  const NotesOfTheOrder({
    super.key,
    this.check,
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
            check == true
                ? const ColumnOfIdAndDateOfTheNotesOfOrder()
                : verticalSpace(1),
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
