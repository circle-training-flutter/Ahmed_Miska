import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/orders/ui/widgets/order_details_item.dart';
import 'package:circletraning/features/orders/ui/widgets/row_of_two_buttoms.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'my_orders'),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  const RowOfTwoButtoms(),
                  verticalSpace(12),
                  const OrderDetailsItem(isexpierd: false),
                  const OrderDetailsItem(isexpierd: true)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
