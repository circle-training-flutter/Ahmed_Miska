import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/custom_red_buttom.dart';
import 'package:circletraning/features/create_and_edit_account/ui/widgets/choose_city_drop_down.dart';
import 'package:circletraning/features/create_and_edit_account/ui/widgets/invited_by_user.dart';
import 'package:circletraning/features/create_and_edit_account/ui/widgets/name_text_field.dart';
import 'package:circletraning/features/create_and_edit_account/ui/widgets/select_photo.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../product/ui/widgets/row_of_prouducts.dart';

class CreateAndEditAccount extends StatelessWidget {
  final bool isEdit;
  const CreateAndEditAccount({Key? key, required this.isEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarOfReturnedScreens(
                title: isEdit ? 'create_account' : 'edit_account'),
            verticalSpace(24),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(children: [
                    const SelectPhoto(),
                    verticalSpace(32),
                    Row(
                      children: [
                        const NameTextField(
                          name: 'first_name',
                        ),
                        horizontalSpace(8),
                        const NameTextField(
                          name: 'last_name',
                        )
                      ],
                    ),
                    isEdit
                        ? Column(children: [
                            verticalSpace(32),
                            const ChooseCityDropDown(),
                            verticalSpace(32),
                            const InvitedByUser(),
                          ])
                        : const SizedBox(),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
              child: CustomRedButtom(
                onTap: () {
                  pushAndRemoveUntil(const MainScreen());
                },
                width: double.infinity,
                child: Center(
                  child: Text(
                    'confirm',
                    style: TextStyles.font14MadaRegularWith,
                  ).tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
