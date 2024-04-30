import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/svg_icon.dart';

class ConnectUsTextField extends StatelessWidget {
  final String title;
  final String icon;
  final int? maxLines;
  final int? minLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Key formKey;
  const ConnectUsTextField({
    super.key,
    required this.title,
    required this.icon,
    this.maxLines,
    this.minLines,
    required this.controller,
    required this.formKey,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyles.font14MadaRegularBlack,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SVGIcon(icon),
          hintText: tr(title),
          hintStyle: TextStyles.font14MadaRegularBlack.copyWith(
            color: ColorManger.gray,
          ),
        ),
      ),
    );
  }
}
