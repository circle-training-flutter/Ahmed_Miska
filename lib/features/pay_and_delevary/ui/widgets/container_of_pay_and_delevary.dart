import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../details_order/ui/widgets/row_of_note_of_the_order.dart';

class ContainerOfPayAndDelevary extends StatelessWidget {
  final String title;
  final String primTitle;
  final String icon;
  final Function() onTap;
  const ContainerOfPayAndDelevary({
    super.key,
    required this.title,
    required this.primTitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: ColorManger.grayLight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
          child: Row(
            children: [
              RowOfNoteOfTheOrder(
                icon: icon,
                title: title,
                primTitle: primTitle,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
              )
            ],
          ),
        ),
      ),
    );
  }
}
