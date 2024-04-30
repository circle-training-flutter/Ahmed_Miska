import 'package:circletraning/data/models/response/my_points_model/my_points_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import 'invite_friend_item.dart';

class InvitefriendListview extends StatelessWidget {
  final List<History> history;
  const InvitefriendListview({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return history.isEmpty
        ? Center(
            child: Text('You Don\'t Have Invite Friends'.tr(), style: TextStyles.font14MadaRegularBlack).tr(),
          )
        : DottedBorder(
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
                    itemCount: history.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: InviteFriendItem(
                          fname: history[index].fromUser!.user!.firstName!,
                          lname: history[index].fromUser!.user!.lastName!,
                          number: history[index].points!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
