import 'dart:async';

import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/show_dilog.dart';
import 'package:circletraning/data/models/body/store_order_request_model.dart';
import 'package:circletraning/data/providers/calculate_order_cost_provider.dart';
import 'package:circletraning/data/providers/shared_prefrance_provider.dart';
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
        child: Consumer<StoreOrderProvider>(builder: (context, provider, _) {
          return Column(
            children: [
              const AppBarOfReturnedScreens(title: 'bill'),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                    child: Column(
                      children: [
                        NotesOfTheOrder(
                          check: false,
                          address: "شارع الحريه",
                          payType: Provider.of<CalculateOrderCostProvider>(context, listen: false).payType,
                          note: Provider.of<CalculateOrderCostProvider>(context, listen: false).noteController.text,
                        ),
                        verticalSpace(12),
                        ProductsOfTheOrderDetails(
                          totalPrice: calc.orderCostModel!.data!.grandTotal!.toDouble(),
                          usePoints: true,
                          onTab: (bool) {
                            setState(() {
                              usepoint = bool;
                            });
                          },
                          productItems: Provider.of<SharedPref>(context).cartItems,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: CustomRedButtom(
                  onTap: () async {
                    await provider.storeOrder(
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
                            ? calc.orderCostModel!.data!.grandTotal!.toDouble() - calc.orderCostModel!.data!.totalPoints!.toDouble()
                            : calc.orderCostModel!.data!.grandTotal!.toDouble(),
                        details: calc.details,
                      ),
                    );
                    // ignore: use_build_context_synchronously
                    await customShowDialog(context);
                    Timer(
                      const Duration(seconds: 2),
                      () {
                        pop();
                      },
                    );
                  },
                  width: double.infinity,
                  child: Center(
                    child: provider.isLoading
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: const CircularProgressIndicator(),
                          )
                        : Text(
                            'send_order',
                            style: TextStyles.font14MadaRegularWith,
                          ).tr(),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
