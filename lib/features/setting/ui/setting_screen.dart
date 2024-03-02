import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/features/setting/ui/widgets/logout_botton.dart';
import 'package:circletraning/features/setting/ui/widgets/row_of_setting.dart';
import 'package:circletraning/features/setting/ui/widgets/select_profile_and_name.dart';
import 'package:circletraning/features/setting/ui/widgets/settings_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.5.h),
              child: Text(
                'more',
                style: TextStyles.font18MadaSemiBoldBlack,
              ).tr(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SelectProfileAndName(),
                    verticalSpace(16),
                    const RowOfSetting(),
                    verticalSpace(16),
                    const SettingsWidget(),
                    verticalSpace(16),
                    const LogOutButton()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
