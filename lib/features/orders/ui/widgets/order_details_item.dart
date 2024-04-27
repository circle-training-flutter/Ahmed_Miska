import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/data/models/response/my_orders/my_orders_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../details_order/ui/details_order_screen.dart';
import 'address_id_row.dart';
import 'address_row.dart';
import 'date_row.dart';

class OrderDetailsItem extends StatelessWidget {
  final bool isexpierd;
  final MyOrdersData myOrdersData;
  const OrderDetailsItem({
    super.key,
    required this.isexpierd,
    required this.myOrdersData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(DetailsOrderScreen(myOrdersData: myOrdersData));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManger.grayLight,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: isexpierd
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(16),
                      AddressIdRow(id: myOrdersData.id!),
                      verticalSpace(16),
                      DateRow(date: myOrdersData.date!, time: myOrdersData.time!),
                      verticalSpace(16),
                      AddressRow(address: myOrdersData.address!),
                      verticalSpace(16),
                      Container(
                        height: 41.h,
                        width: 110.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: ColorManger.white, border: Border.all(color: const Color(0xffE4D9C4))),
                        child: Center(
                          child: Text(
                            'expierd',
                            style: TextStyles.font14MadaRegularBlack.copyWith(color: ColorManger.red),
                          ).tr(),
                        ),
                      ),
                      verticalSpace(16),
                    ],
                  )
                : Column(
                    children: [
                      verticalSpace(16),
                      AddressIdRow(id: myOrdersData.id!),
                      verticalSpace(16),
                      DateRow(date: myOrdersData.date!, time: myOrdersData.time!),
                      verticalSpace(16),
                      AddressRow(address: myOrdersData.address!),
                      verticalSpace(16),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
