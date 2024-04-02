import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/custom_red_buttom.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/contact_us/ui/widgets/connect_us_textfield.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'connect_us'),
            verticalSpace(24),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SVGIcon(
                        AppIcons.connectUsIcon,
                        height: 150.h,
                        width: 196.w,
                      ),
                      verticalSpace(48),
                      ConnectUsTextField(
                        title: 'the_name',
                        icon: AppIcons.nameIcon,
                      ),
                      const Divider(color: ColorManger.grayLight),
                      ConnectUsTextField(
                        title: 'email',
                        icon: AppIcons.emailIcon,
                      ),
                      const Divider(color: ColorManger.grayLight),
                      ConnectUsTextField(
                        title: 'message_title',
                        icon: AppIcons.noteTitleIcon,
                      ),
                      const Divider(color: ColorManger.grayLight),
                      ConnectUsTextField(
                        maxLines: 10,
                        title: 'message',
                        icon: AppIcons.notesIcon,
                      ),
                      const Divider(color: ColorManger.grayLight),
                      verticalSpace(48),
                      CustomRedButtom(
                          onTap: () {},
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'send',
                              style: TextStyles.font14MadaRegularWith,
                            ).tr(),
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
