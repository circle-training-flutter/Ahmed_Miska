import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/data/models/body/calculate_order_cost_request_model.dart';
import 'package:circletraning/data/providers/calculate_order_cost_provider.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/container_of_pay_and_delevary.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/listview_of_items_in_pay_and_delevary_screen.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/notes_text_field.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/pay_way_buttom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/helpers/functions.dart';
import '../../../core/theming/styles.dart';
import '../../product/ui/widgets/row_of_prouducts.dart';
import '../../product_details/ui/widgets/total_price.dart';

class PayAndDelevaryScreen extends StatefulWidget {
  final int price;
  const PayAndDelevaryScreen({Key? key, required this.price}) : super(key: key);

  @override
  State<PayAndDelevaryScreen> createState() => _PayAndDelevaryScreenState();
}

class _PayAndDelevaryScreenState extends State<PayAndDelevaryScreen> {
  // @override
  // void initState() {
  //   Provider.of<CalculateOrderCostProvider>(context, listen: false).details.clear();
  //   for (int i = 0; i < Provider.of<SharedPref>(context, listen: false).cartItems.length; i++) {
  //     int id = Provider.of<SharedPref>(context, listen: false).cartItems[i].id!;
  //     int quantity = Provider.of<SharedPref>(context, listen: false).cartItems[i].weightUnit!;
  //     Provider.of<CalculateOrderCostProvider>(context, listen: false).details.add(Detail(productId: id, qty: quantity, netCost: 0));
  //   }

  //   super.initState();
  // }

  String title = 'cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CalculateOrderCostProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                const AppBarOfReturnedScreens(title: 'pay_and_delevary'),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                      child: Column(
                        children: [
                          const ListviewOfItemsInPayAndDelevaryScreen(),
                          verticalSpace(12),
                          ContainerOfPayAndDelevary(
                            onTap: () {},
                            title: 'delivery_address',
                            primTitle: 'address',
                            icon: AppIcons.locationIcon,
                          ),
                          verticalSpace(12),
                          ContainerOfPayAndDelevary(
                            onTap: () {
                              displayBottomSheet(context, PayWayButtomSheet(
                                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                onTap: (String) {
                                  setState(() {
                                    title = String;
                                    provider.payType = String;
                                  });
                                },
                              ));
                            },
                            title: 'payment_method',
                            primTitle: title,
                            icon: AppIcons.payIcon,
                          ),
                          verticalSpace(12),
                          NotesTextField(controller: provider.noteController)
                        ],
                      ),
                    ),
                  ),
                ),
                TotalPrice(
                  price: widget.price,
                  buttom: provider.isLoading
                      ? SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: const CircularProgressIndicator(),
                        )
                      : Text(
                          'confirm',
                          style: TextStyles.font14MadaRegularWith,
                        ).tr(),
                  onTap: () async {
                    await provider.calculateOrderCost(
                      OrderCostRequestModel(
                        latitude: 30.0444,
                        longitude: 31.2357,
                        details: provider.details,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
