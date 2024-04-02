import 'package:circletraning/features/pay_and_delevary/ui/widgets/pay_way_item.dart';
import 'package:flutter/material.dart';

class PayWayListView extends StatefulWidget {
  const PayWayListView({
    super.key,
  });

  @override
  State<PayWayListView> createState() => _PayWayListViewState();
}

class _PayWayListViewState extends State<PayWayListView> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected = index;
            });
          },
          child: PayWayItem(
            isSelected: isSelected == index ? true : false,
          ),
        );
      },
    );
  }
}
