import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class CustomButtomIcon extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const CustomButtomIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SVGIcon(icon),
    );
  }
}
