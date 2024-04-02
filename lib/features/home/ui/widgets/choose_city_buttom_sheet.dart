import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_red_buttom.dart';
import '../../../../core/widgets/svg_icon.dart';
import 'listview_of_choose_city.dart';

class ChooseCityButtomSheet extends StatelessWidget {
  const ChooseCityButtomSheet({Key? key}) : super(key: key);

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
                      'governorate',
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
                const ListviewOfChooseCity(),
                verticalSpace(16),
                CustomRedButtom(
                  onTap: () {
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
