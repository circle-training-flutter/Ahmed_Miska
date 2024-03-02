import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CurrentAndPreviosButtom extends StatefulWidget {
  final String title;
  final bool check;
  const CurrentAndPreviosButtom({
    super.key,
    required this.title,
    required this.check,
  });

  @override
  State<CurrentAndPreviosButtom> createState() =>
      _CurrentAndPreviosButtomState();
}

class _CurrentAndPreviosButtomState extends State<CurrentAndPreviosButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 166.w,
      decoration: BoxDecoration(
        color: widget.check ? ColorManger.red : ColorManger.grayLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          widget.title,
          style: TextStyles.font16MadaRegularBlack.copyWith(
              color: widget.check ? ColorManger.white : ColorManger.gray),
        ).tr(),
      ),
    );
  }
}
