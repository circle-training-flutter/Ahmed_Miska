import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        height: 24.h,
        width: 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: _value ? ColorManger.red : ColorManger.white,
          border:
              Border.all(color: _value ? ColorManger.red : ColorManger.gray),
        ),
        child: _value
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : const Icon(
                Icons.check_box_outline_blank,
                color: ColorManger.white,
              ),
      ),
    ));
    // return Container(
    //   height: 24.h,
    //   width: 24.w,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8.r),
    //   ),
    //   child: Transform.scale(
    //     scale: 1.sp,
    //     child: Checkbox(
    //       value: isChecked,
    //       activeColor: ColorManger.red,
    //       shape: OutlinedBorder(

    //       ),
    //       onChanged: (value) {
    //         setState(() {
    //           isChecked = value!;
    //         });
    //       },
    //     ),
    //   ),
    // );
  }
}
