import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class NotesTextField extends StatelessWidget {
  const NotesTextField({Key? key, required this.controller}) : super(key: key);
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller,
      maxLines: null,
      minLines: null,
      textAlign: TextAlign.start,
      style: TextStyles.font14MadaRegularBlack,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),

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
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
          child: SVGIcon(
            AppIcons.notesIcon,
            height: 20.h,
            width: 20.w,
          ),
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
