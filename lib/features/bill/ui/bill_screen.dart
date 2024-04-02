import 'dart:async';

import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/show_dilog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_red_buttom.dart';
import '../../details_order/ui/widgets/note_of_the_order.dart';
import '../../../core/widgets/products_of_the_order_details.dart';
import '../../orders/ui/my_orders_screen.dart';
import '../../product/ui/widgets/row_of_prouducts.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'bill'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                  child: Column(
                    children: [
                      const NotesOfTheOrder(check: false),
                      verticalSpace(12),
                      const ProductsOfTheOrderDetails(usePoints: true)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: CustomRedButtom(
                onTap: () {
                  customShowDialog(context);
                  Timer(
                    const Duration(seconds: 2),
                    () {
                      push(const MyOrdersScreen(
                        check: true,
                      ));
                    },
                  );
                },
                width: double.infinity,
                child: Center(
                  child: Text(
                    'send_order',
                    style: TextStyles.font14MadaRegularWith,
                  ).tr(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
