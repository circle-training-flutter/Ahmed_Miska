import 'package:circletraning/features/product_details/ui/widgets/price_of_product.dart';
import 'package:circletraning/features/product_details/ui/widgets/total_amount_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../data/models/response/product_model/product_datum.dart';
import 'increment_and_decrement.dart';

class TotalAmount extends StatefulWidget {
  final ProductModelItem product;
  final void Function(dynamic productTotalPrice) productTotalPrice;

  const TotalAmount({
    Key? key,
    required this.product,
    required this.productTotalPrice,
  }) : super(key: key);

  @override
  State<TotalAmount> createState() => _TotalAmountState();
}

class _TotalAmountState extends State<TotalAmount> {
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
            PriceOfProduct(
              price: widget.product.price!,
            ),
            verticalSpace(12),
            SizedBox(
              height: 48.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IncrementAndDecrement(
                    onTap: () {
                      setState(() {
                        if (widget.product.weightUnit! > 1) {
                          widget.product.weightUnit = widget.product.weightUnit - 1;
                          widget.productTotalPrice(widget.product.price! * widget.product.weightUnit!);
                        }
                      });
                    },
                    icon: AppIcons.negativeIcon,
                    color: ColorManger.grayLight,
                  ),
                  horizontalSpace(8),
                  TotalAmountNumber(amount: widget.product.weightUnit!),
                  horizontalSpace(8),
                  IncrementAndDecrement(
                    onTap: () {
                      setState(() {
                        widget.product.weightUnit = widget.product.weightUnit + 1;
                        widget.productTotalPrice(widget.product.price! * widget.product.weightUnit!);
                      });
                    },
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
