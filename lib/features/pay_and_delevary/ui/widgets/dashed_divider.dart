import 'package:circletraning/core/theming/colors.dart';
import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  const MySeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        const dashHeight = 1.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(
            dashCount,
            (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: ColorManger.red.withOpacity(.3)),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
