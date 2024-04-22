import 'package:circletraning/features/pay_and_delevary/ui/widgets/pay_and_delevary_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../data/providers/shared_prefrance_provider.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/dashed_divider.dart';

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
        child: Consumer<SharedPref>(builder: (context, sharedPref, child) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sharedPref.cartItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  verticalSpace(12),
                  PayAndDelevaryItem(
                    product: sharedPref.cartItems[index],
                  ),
                  verticalSpace(12),
                  index != sharedPref.cartItems.length - 1 ? MySeparator(color: ColorManger.red.withOpacity(.3)) : const SizedBox(),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
