import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/features/setting/ui/widgets/row_of_set_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 374.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.grayMoreLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(
                'settings',
                style: TextStyles.font12MadaRegularGray,
              ).tr(),
            ),
            RowOfSetSettings(
              text: 'modify_my_account',
              icon: AppIcons.editProfileIcon,
            ),
            verticalSpace(16),
            RowOfSetSettings(
              text: 'language',
              icon: AppIcons.languageIcon,
            ),
            verticalSpace(16),
            RowOfSetSettings(
              text: 'connect_us',
              icon: AppIcons.contactUsIcon,
            ),
            verticalSpace(16),
            RowOfSetSettings(
              text: 'about_this_app',
              icon: AppIcons.aboutAppIcon,
            ),
            verticalSpace(16),
            RowOfSetSettings(
              text: 'app_evaluation',
              icon: AppIcons.rateAppIcon,
            ),
            verticalSpace(16),
            SizedBox(
              height: 48.h,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                    child: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(AppIcons.deleteAccountIcon),
                    ),
                  ),
                  Text(
                    'delete_account',
                    style: TextStyles.font14MadaRegularBlack
                        .copyWith(color: ColorManger.red),
                  ).tr(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
