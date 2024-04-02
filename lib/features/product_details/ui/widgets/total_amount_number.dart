import 'package:circletraning/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class TotalAmountNumber extends StatelessWidget {
  final int amount;
  const TotalAmountNumber({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 199.w,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          amount.toString(),
          style: TextStyles.font16MadaSemiBoldBlack,
        ),
      ),
    );
  }
}
