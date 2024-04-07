import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/svg_icon.dart';

class CustomInputTextField extends StatefulWidget {
  final TextEditingController controller;
  final Key formKey;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String hitText;
  final String? prefixIcon;
  const CustomInputTextField({
    super.key,
    required this.controller,
    required this.formKey,
    this.validator,
    this.keyboardType,
    required this.hitText,
    this.prefixIcon,
  });

  @override
  State<CustomInputTextField> createState() => _CustomInputTextFieldState();
}

class _CustomInputTextFieldState extends State<CustomInputTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        style: TextStyles.font14MadaRegularBlack,
        decoration: InputDecoration(
          hintText: tr(widget.hitText),
          hintStyle: TextStyles.font14MadaRegularBlack,
          prefixIcon: widget.prefixIcon == null
              ? null
              : SVGIcon(
                  widget.prefixIcon!,
                ),
          fillColor: ColorManger.grayMoreLight,
          enabledBorder: fieldBorder(false),
          focusedBorder: fieldBorder(false, isEnable: true),
          errorBorder: fieldBorder(true),
          focusedErrorBorder: fieldBorder(true),
        ),
      ),
    );
  }
}

OutlineInputBorder fieldBorder(bool isError, {bool isEnable = false}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.r),
    borderSide: BorderSide(
      color: isError
          ? ColorManger.red
          : isEnable
              ? Colors.blue
              : ColorManger.grayLight,
      width: 1.3.w,
    ),
  );
}
