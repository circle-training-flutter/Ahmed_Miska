import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت',
            style: TextStyles.font12MadaRegularGray,
          ).tr(),
          verticalSpace(4),
          Row(
            children: [
              Text(
                '5',
                style: TextStyles.font14MadaRegularBlack
                    .copyWith(color: ColorManger.red),
              ).tr(),
              horizontalSpace(4),
              Text(
                'د',
                style: TextStyles.font14MadaRegularBlack,
              )
            ],
          ),
          verticalSpace(16),
          const Divider(color: ColorManger.grayLight)
        ],
      ),
    );
  }
}
