import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/features/product_details/ui/widgets/price_of_product.dart';
import 'package:circletraning/features/product_details/ui/widgets/total_amount_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import 'increment_and_decrement.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.grayLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: Column(
          children: [
            const PriceOfProduct(),
            verticalSpace(12),
            SizedBox(
              height: 48.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IncrementAndDecrement(
                    icon: AppIcons.negativeIcon,
                    color: ColorManger.grayLight,
                  ),
                  horizontalSpace(8),
                  const TotalAmountNumber(),
                  horizontalSpace(8),
                  IncrementAndDecrement(
                    icon: AppIcons.positiveIcon,
                    color: ColorManger.grayLight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
