import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/styles.dart';

class NotesTextField extends StatelessWidget {
  const NotesTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      minLines: null,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: 'notes'.tr(),
        hintStyle: TextStyles.font12MadaRegularGray,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        // prefix: SizedBox(
        //   height: 20.h,
        //   width: 20.w,
        //   child: SvgPicture.asset(AppIcons.notesIcon, fit: BoxFit.none),
        // ),
        prefixIcon: SizedBox(
          height: 20.h,
          width: 20.w,
          child: SvgPicture.asset(AppIcons.notesIcon, fit: BoxFit.none),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: ColorManger.grayLight),
    );
  }
}
