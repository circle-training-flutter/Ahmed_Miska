import 'package:circletraning/core/helpers/functions.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/widgets/custom_red_buttom.dart';
import 'package:circletraning/features/sign_up/ui/widgets/otp_buttom_sheet.dart';
import 'package:circletraning/features/sign_up/ui/widgets/phone_input_field.dart';
import 'package:circletraning/features/sign_up/ui/widgets/select_country_continer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/consatants.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/svg_icon.dart';
import '../../product/ui/widgets/row_of_prouducts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: ''),
            Expanded(
              child: SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SVGIcon(
                          AppIcons.logoAndNameIcon,
                          height: 120.h,
                          width: 134.w,
                        ),
                      ),
                      verticalSpace(64),
                      Text(
                        'hey',
                        style: TextStyles.font28MadaRegularGray,
                      ).tr(),
                      verticalSpace(8),
                      Text(
                        'sign_in_now',
                        style: TextStyles.font14MadaRegularBlack
                            .copyWith(color: ColorManger.gray),
                      ).tr(),
                      verticalSpace(24),
                      const SelectCountryContainer(),
                      verticalSpace(16),
                      const PhoneInputField(),
                      verticalSpace(24),
                      CustomRedButtom(
                        onTap: () {
                          displayBottomSheet(context, const OtpButtomSheet());
                        },
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'in',
                            style: TextStyles.font14MadaRegularWith,
                          ).tr(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: SVGIcon(
            //     AppIcons.logoIconGray,
            //     height: 95.h,
            //     width: 125.w,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
