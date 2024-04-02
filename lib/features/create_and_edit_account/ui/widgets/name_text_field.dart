import 'package:circletraning/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class NameTextField extends StatelessWidget {
  final String name;
  const NameTextField({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 60.h,
      width: 167.w,
      child: TextField(
        style: TextStyles.font16MadaRegularBlack,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: tr(name),
          labelStyle: TextStyles.font16MadaRegularBlack,
          alignLabelWithHint: false,
          floatingLabelStyle: TextStyles.font12MadaRegularGray,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          border: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: ColorManger.grayLight),
    );
  }
}
