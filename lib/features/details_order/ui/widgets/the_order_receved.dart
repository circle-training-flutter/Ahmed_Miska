import 'package:circletraning/features/details_order/ui/widgets/track_order.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class TheOrderReceved extends StatelessWidget {
  final Widget child;
  final String title;
  final double value;
  final String icon;

  const TheOrderReceved({
    super.key,
    required this.child,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrackOrder(
          icon: icon,
          title: title,
          value: value,
        ),
        verticalSpace(22),
        child,
        verticalSpace(19)
      ],
    );
  }
}
