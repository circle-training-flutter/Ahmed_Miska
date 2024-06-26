import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/data/models/response/my_orders/my_orders_model.dart';
import 'package:circletraning/features/details_order/ui/widgets/note_of_the_order.dart';
import 'package:circletraning/core/widgets/products_of_the_order_details.dart';
import 'package:circletraning/features/details_order/ui/widgets/slider_and_track_order.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsOrderScreen extends StatelessWidget {
  final MyOrdersData myOrdersData;
  const DetailsOrderScreen({Key? key, required this.myOrdersData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const AppBarOfReturnedScreens(title: 'order_details'),
          verticalSpace(24),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const SliderAndTrackOrder(),
                    ),
                    verticalSpace(24),
                    NotesOfTheOrder(
                      check: true,
                      id: myOrdersData.id!,
                      address: myOrdersData.address!,
                      payType: myOrdersData.payType!,
                      note: myOrdersData.notes,
                    ),
                    verticalSpace(12),
                    ProductsOfTheOrderDetails(
                    deliveryPrice: myOrdersData.deliveryPrice!,
                      totalPrice: myOrdersData.grandTotal!,
                      usePoints: false,
                      // ignore: avoid_types_as_parameter_names
                      onTab: (bool) {},
                      productItems: myOrdersData.details!.map((e) => e.product!).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
