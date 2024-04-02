import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_circle_checkbox.dart';

class ChoseLanguageRow extends StatelessWidget {
  final bool isChecked;
  final String text;
  const ChoseLanguageRow({
    super.key,
    required this.isChecked,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          SizedBox(
            height: 16.h,
            width: 16.w,
            child: CustomCircleCheckBox(
              ischecked: isChecked,
            ),
          ),
          horizontalSpace(12),
          Text(
            text,
            style: TextStyles.font14MadaRegularBlack,
          ).tr(),
        ],
      ),
    );
  }
}
