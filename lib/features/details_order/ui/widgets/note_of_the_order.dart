import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/details_order/ui/widgets/row_of_note_of_the_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class NotesOfTheOrder extends StatelessWidget {
  final bool? check;
  final int? id;
  final String address, payType;
  final String? note;

  const NotesOfTheOrder({
    super.key,
    this.check,
    this.id,
    required this.address,
    required this.payType,
    required this.note,
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
            // check == true
            //     ? ColumnOfIdAndDateOfTheNotesOfOrder(
            //         date: myOrdersData.date!,
            //         time: myOrdersData.time!,
            //         id: myOrdersData.id!,
            //       )
            //     : verticalSpace(1),
            RowOfNoteOfTheOrder(
              icon: AppIcons.restBranchIcon,
              title: 'branch',
              primTitle: address,
            ),
            verticalSpace(20),
            RowOfNoteOfTheOrder(
              icon: AppIcons.locationIcon,
              title: address,
              primTitle: address,
            ),
            verticalSpace(20),
            RowOfNoteOfTheOrder(
              icon: AppIcons.payIcon,
              title: 'payment_method',
              primTitle: payType,
            ),
            verticalSpace(20),
            note == null
                ? verticalSpace(1)
                : RowOfNoteOfTheOrder(
                    icon: AppIcons.notesIcon,
                    title: 'comments',
                    primTitle: note!,
                  ),
          ],
        ),
      ),
    );
  }
}
