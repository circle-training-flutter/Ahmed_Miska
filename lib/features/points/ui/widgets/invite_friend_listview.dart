import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import 'invite_friend_item.dart';

class InvitefriendListview extends StatelessWidget {
  const InvitefriendListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color(0xffC3C3C3),
      strokeWidth: 1.w,
      dashPattern: const [3, 3],
      borderType: BorderType.RRect,
      radius: Radius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'registery',
              style: TextStyles.font12MadaRegularGray,
            ).tr(),
            verticalSpace(12),
            ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: const InviteFriendItem(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
