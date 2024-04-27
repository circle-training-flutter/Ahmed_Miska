import 'package:circletraning/core/widgets/custom_error_widget.dart';
import 'package:circletraning/core/widgets/loading_widget.dart';
import 'package:circletraning/data/providers/my_orders_provider.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/orders/ui/widgets/order_details_item.dart';
import 'package:circletraning/features/orders/ui/widgets/row_of_two_buttoms.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatefulWidget {
  final bool check;
  const MyOrdersScreen({Key? key, required this.check}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  String type = 'new';

  @override
  void initState() {
    Provider.of<MyOrdersProvider>(context, listen: false).getMyOrders(context, query: {'type': type});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Consumer<MyOrdersProvider>(
            builder: (context, provider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarOfReturnedScreens(title: 'my_orders', check: widget.check),
                  verticalSpace(24),
                  RowOfTwoButtoms(onTap: (value) {
                    setState(() {
                      type = value;
                      Provider.of<MyOrdersProvider>(context, listen: false).getMyOrders(context, query: {'type': type});
                    });
                  }),
                  verticalSpace(12),
                  Expanded(
                    child: provider.isFailure
                        ? CustomErrorWidget(errMessage: provider.productfailure.errMessage)
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: provider.isLoading ? 1 : provider.myOrdersModelList.length,
                            itemBuilder: (_, index) {
                              return provider.isLoading
                                  ? LoadingWidget(height: 120.h, width: double.infinity)
                                  : OrderDetailsItem(isexpierd: provider.myOrdersModelList[index].status == 'canceled', myOrdersData: provider.myOrdersModelList[index]);
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
