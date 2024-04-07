import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/widgets/custom_red_buttom.dart';
import '../../../../core/widgets/svg_icon.dart';
import '../../../../loca.dart';
import '../../../../main.dart';
import 'listview_of_chose_lang.dart';

class ChoseLanguageButtomSheet extends StatefulWidget {
  const ChoseLanguageButtomSheet({Key? key}) : super(key: key);

  @override
  State<ChoseLanguageButtomSheet> createState() => _ChoseLanguageButtomSheetState();
}

class _ChoseLanguageButtomSheetState extends State<ChoseLanguageButtomSheet> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36.r),
              topRight: Radius.circular(36.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 24.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'language',
                      style: TextStyles.font18MadaSemiBoldBlack,
                    ).tr(),
                    const Spacer(),
                    IconButton(
                      icon: SVGIcon(AppIcons.closeIcon),
                      onPressed: () {
                        pop();
                      },
                    )
                  ],
                ),
                verticalSpace(16),
                ListviewOfChoseLang(onindexSelected: (int index) {
                  _index = index;
                }),
                verticalSpace(16),
                CustomRedButtom(
                  onTap: () {
                    if (_index == 0) {
                      saveUserData.saveLang('ar');
                      LocalizationCheck.changelang(context);
                    }
                    if (_index == 1) {
                      saveUserData.saveLang('en');
                      LocalizationCheck.changelang(context);
                    }
                    pop();
                  },
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'confirm',
                      style: TextStyles.font14MadaRegularWith,
                    ).tr(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
