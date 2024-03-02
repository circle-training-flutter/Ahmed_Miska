import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class LinerIndecator extends StatefulWidget {
  final double value;
  const LinerIndecator({Key? key, required this.value}) : super(key: key);

  @override
  State<LinerIndecator> createState() => _LinerIndecatorState();
}

class _LinerIndecatorState extends State<LinerIndecator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearProgressIndicator(
        color: ColorManger.red,
        backgroundColor: ColorManger.grayLight,
        value: widget.value,
        minHeight: 8.h,
        borderRadius: BorderRadius.circular(10.r),
        valueColor: const AlwaysStoppedAnimation<Color>(ColorManger.red),
      ),
    );
  }
}
