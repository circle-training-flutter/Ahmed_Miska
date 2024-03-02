
import 'package:circletraning/features/pay_and_delevary/ui/widgets/pay_and_delevary_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import 'dashed_divider.dart';

class ListviewOfItemsInPayAndDelevaryScreen extends StatelessWidget {
  const ListviewOfItemsInPayAndDelevaryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorManger.red.withOpacity(.05),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 4.h,
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Column(
              children: [
                verticalSpace(12),
                const PayAndDelevaryItem(),
                verticalSpace(12),
                index != 1
                    ? const MySeparator()
                    : const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
