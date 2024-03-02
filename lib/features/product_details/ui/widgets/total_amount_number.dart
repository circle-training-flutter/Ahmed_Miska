
import 'package:circletraning/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class TotalAmountNumber extends StatelessWidget {
  const TotalAmountNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 199.w,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius:
            BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          '2',
          style: TextStyles
              .font16MadaSemiBoldBlack,
        ),
      ),
    );
  }
}