
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../product_details/ui/widgets/increment_and_decrement.dart';

class CounterInCartItem extends StatelessWidget {
  const CounterInCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57.h,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          IncrementAndDecrement(
            icon: AppIcons.negativeIcon,
            color: ColorManger.grayLight,
          ),
          horizontalSpace(8),
          Container(
            width: 124.w,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(16.r),
              color: ColorManger.white,
              border: Border.all(
                color: ColorManger.grayLight,
                width: 1.w,
              ),
            ),
            child: Center(
              child: Text(
                '2',
                style: TextStyles
                    .font16MadaSemiBoldBlack,
              ).tr(),
            ),
          ),
          horizontalSpace(8),
          IncrementAndDecrement(
            icon: AppIcons.positiveIcon,
            color: ColorManger.grayLight,
          ),
        ],
      ),
    );
  }
}