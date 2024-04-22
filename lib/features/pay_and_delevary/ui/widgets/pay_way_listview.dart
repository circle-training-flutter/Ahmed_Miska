import 'package:circletraning/features/pay_and_delevary/ui/widgets/pay_way_item.dart';
import 'package:flutter/material.dart';

class PayWayListView extends StatefulWidget {
  final void Function(String) onTap;
  const PayWayListView({
    super.key, required this.onTap,
  });

  @override
  State<PayWayListView> createState() => _PayWayListViewState();
}

class _PayWayListViewState extends State<PayWayListView> {
  final List<String> list = ['cash', 'online'];
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected = index;
            });
            widget.onTap(list[index]);
          },
          child: PayWayItem(
            title: list[index],
            isSelected: isSelected == index,
          ),
        );
      },
    );
  }
}
