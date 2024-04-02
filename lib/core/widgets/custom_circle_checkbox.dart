import 'package:flutter/material.dart';

import '../theming/colors.dart';

class CustomCircleCheckBox extends StatefulWidget {
  final bool ischecked;
  const CustomCircleCheckBox({
    super.key,
    required this.ischecked,
  });

  @override
  State<CustomCircleCheckBox> createState() => _CustomCircleCheckBoxState();
}

class _CustomCircleCheckBoxState extends State<CustomCircleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.ischecked,
      activeColor: ColorManger.red,
      checkColor: ColorManger.red,
      side: const BorderSide(color: ColorManger.red),
      shape: const CircleBorder(),
      onChanged: (value) {},
    );
  }
}
