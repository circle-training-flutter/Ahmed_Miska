
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/data/models/body/store_order_request_model.dart';
import 'package:circletraning/data/providers/calculate_order_cost_provider.dart';
import 'package:circletraning/data/providers/store_order_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_red_buttom.dart';
import '../../details_order/ui/widgets/note_of_the_order.dart';
import '../../../core/widgets/products_of_the_order_details.dart';
import '../../product/ui/widgets/row_of_prouducts.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  bool usepoint = false;
  @override
  Widget build(BuildContext context) {

    var calc = Provider.of<CalculateOrderCostProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'bill'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                  child: Column(
                    children: [
                      const NotesOfTheOrder(check: false),
                      verticalSpace(12),
                      ProductsOfTheOrderDetails(
                        usePoints: true,
                        // ignore: avoid_types_as_parameter_names
                        onTab: (bool) {
                          setState(() {
                            usepoint = bool;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: CustomRedButtom(
                onTap: () {
                  Provider.of<StoreOrderProvider>(context, listen: false).storeOrder(
                    StoreOrderRequestModel(
                      address: "شارع الحريه",
                      delivery: 1,
                      latitude: 30.0444,
                      longitude: 31.2357,
                      notes: Provider.of<CalculateOrderCostProvider>(context, listen: false).noteController.text,
                      payType: Provider.of<CalculateOrderCostProvider>(context, listen: false).payType,
                      netTotal: calc.orderCostModel!.data!.netTotal,
                      driverCost: calc.orderCostModel!.data!.deliveryPrice,
                      isPoints: usepoint,
                      pointsCount: calc.orderCostModel!.data!.totalPoints,
                      pointsValue: 30,
                      taxValue: calc.orderCostModel!.data!.taxValue!.toDouble(),
                      grandTotal: usepoint
                          ? calc.orderCostModel!.data!.grandTotal!.toDouble() - calc.orderCostModel!.data!.totalPoints!.toDouble() - 30
                          : calc.orderCostModel!.data!.grandTotal!.toDouble(),
                      details: calc.details,
                    ),
                  );
                  // customShowDialog(context);
                  // Timer(
                  //   const Duration(seconds: 2),
                  //   () {

                  //   },
                  // );
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
