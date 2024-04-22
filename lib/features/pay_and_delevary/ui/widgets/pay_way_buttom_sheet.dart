import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/pay_way_and_close.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/pay_way_listview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_red_buttom.dart';

class PayWayButtomSheet extends StatelessWidget {
  final void Function(String) onTap;
  const PayWayButtomSheet({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36.r),
              topRight: Radius.circular(36.r),
            ),
            color: ColorManger.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(24),
              const PayWayAndClose(),
              verticalSpace(30),
              PayWayListView(
                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                onTap: (String) {
                  onTap(String);
                },
              ),
              verticalSpace(26),
              CustomRedButtom(
                onTap: () {
                  pop();
                },
                width: double.infinity,
                child: Center(
                  child: Text(
                    'confirm',
                    style: TextStyles.font14MadaRegularWith,
                  ).tr(),
                ),
              ),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}
