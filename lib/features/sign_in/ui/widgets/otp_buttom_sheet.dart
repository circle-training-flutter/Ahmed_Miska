import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_red_buttom.dart';
import '../../../create_and_edit_account/ui/create_and_edit_account.dart';
import 'otp_and_send_the_code.dart';

class OtpButtomSheet extends StatelessWidget {
  const OtpButtomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.white,
          borderRadius: BorderRadius.circular(36.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SVGIcon(
                AppIcons.otp,
                height: 150.h,
                width: 225.w,
              ),
              verticalSpace(16),
              Text(
                'otp_message',
                style: TextStyles.font14MadaRegularBlack,
              ).tr(),
              Text(
                '0123456789',
                style: TextStyles.font14MadaRegularBlack,
              ).tr(),
              verticalSpace(16),
              const OtpAndSendTheCode(),
              verticalSpace(16),
              CustomRedButtom(
                onTap: () {
                  pushReplacement(const CreateAndEditAccount(
                    iscreate: true,
                  ));
                },
                width: double.infinity,
                child: Center(
                  child: Text(
                    'confirm',
                    style: TextStyles.font14MadaRegularWith,
                  ).tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
