import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/colors.dart';
import 'edit_and_cancel_order_buttom.dart';

class RowOfCancelAndEditOrder extends StatelessWidget {
  const RowOfCancelAndEditOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          EditAndCancelOrderButtom(
            title: 'edit',
            icon: AppIcons.editIcon,
            color: ColorManger.red,
          ),
          const Spacer(),
          EditAndCancelOrderButtom(
            title: 'cancel',
            icon: AppIcons.cancelIcon,
            color: ColorManger.black,
          ),
        ],
      ),
    );
  }
}
