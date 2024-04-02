import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/svg_icon.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyles.font14MadaRegularBlack,
      decoration: InputDecoration(
        hintText: tr('phone_number'),
        hintStyle: TextStyles.font14MadaRegularBlack,
        prefixIcon: SVGIcon(AppIcons.phoneIcon),
        fillColor: ColorManger.grayMoreLight,
        enabledBorder: phoneBorder(),
        focusedBorder: phoneBorder(),
        errorBorder: phoneBorder(),
        focusedErrorBorder: phoneBorder(),
      ),
    );
  }
}

OutlineInputBorder phoneBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.r),
    borderSide: const BorderSide(color: ColorManger.grayLight),
  );
}
