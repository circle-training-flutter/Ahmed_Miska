import 'package:circletraning/features/setting/ui/widgets/select_profile_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../main.dart';

class SelectProfileAndName extends StatelessWidget {
  const SelectProfileAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 159.h,
      child: Column(
        children: [
          const SelectProfileImage(),
          verticalSpace(8),
          Text(
            saveUserData.getUserToken() != '' ? '${saveUserData.getUserData()!.firstName!} ${saveUserData.getUserData()!.lastName!}' : 'name',
            style: TextStyles.font18MadaSemiBoldBlack,
          ).tr(),
        ],
      ),
    );
  }
}
