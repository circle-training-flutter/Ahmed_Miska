import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../main.dart';
import '../../../sign_in/ui/sign_in.dart';


class LogOutAndLoginButton extends StatelessWidget {
  final String text;
  const LogOutAndLoginButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: unnecessary_null_comparison
        if (saveUserData.getUserToken() != '') {
          saveUserData.clearSharedData();
          push(const MainScreen());
        } else {
          push(const SigninScreen());
        }
      },
      child: Container(
        width: 167.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: ColorManger.black,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 24.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SVGIcon(AppIcons.logoutIcon),
              Text(
                // ignore: unnecessary_null_comparison
                saveUserData.getUserToken() != '' ? 'logout' : 'login',
                style: TextStyles.font14MadaRegularBlack,
              ).tr()
            ],
          ),
        ),
      ),
    );
  }
}
