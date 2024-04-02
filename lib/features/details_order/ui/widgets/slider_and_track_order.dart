import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/features/details_order/ui/widgets/number_and_call_delivery_container.dart';
import 'package:circletraning/features/details_order/ui/widgets/row_of_cancel_and_edit_order.dart';
import 'package:circletraning/features/details_order/ui/widgets/the_order_receved.dart';
import 'package:circletraning/features/details_order/ui/widgets/track_order.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:flutter/material.dart';

class SliderAndTrackOrder extends StatefulWidget {
  const SliderAndTrackOrder({
    super.key,
  });

  @override
  State<SliderAndTrackOrder> createState() => _SliderAndTrackOrderState();
}

class _SliderAndTrackOrderState extends State<SliderAndTrackOrder> {
  int index = 0;
  List<Widget> children = [
    TheOrderReceved(
      title: 'request_received',
      value: 1 / 6,
      icon: AppIcons.acceptedOrderIcon,
      child: const RowOfCancelAndEditOrder(),
    ),
    TrackOrder(
      icon: AppIcons.acceptedOrderIcon,
      title: 'has_been_approved',
      value: 2 / 6,
    ),
    TrackOrder(
      icon: AppIcons.preparingIcon,
      title: 'preparing',
      value: 3 / 6,
    ),
    TheOrderReceved(
      title: 'delivered_to_the_representative',
      value: 4 / 6,
      icon: AppIcons.deliveredPagIcon,
      child: const NumberAndCallDeliveryContainer(),
    ),
    TheOrderReceved(
      title: 'delivery_is_in_progress',
      value: 5 / 6,
      icon: AppIcons.deliveryProgressIcon,
      child: const NumberAndCallDeliveryContainer(),
    ),
    TrackOrder(
      icon: AppIcons.completedOrderIcon,
      title: 'been_completed',
      value: 6 / 6,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (index < children.length - 1) {
            setState(() {
              index++;
            });
          } else {
            pushAndRemoveUntil(const MainScreen());
          }
        },
        child: children[index]);
  }
}
