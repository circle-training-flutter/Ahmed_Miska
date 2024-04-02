import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SVGIcon extends StatelessWidget {
  final String _assets;
  final double? _height;
  final double? _width;
  const SVGIcon(String assets,
      {super.key, Color? color, double? height, double? width})
      : _assets = assets,
        _height = height,
        _width = width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height ?? 24.h,
      width: _width ?? 24.w,
      child: Center(
        child: SvgPicture.asset(
          _assets,
          height: _height ?? 24.h,
          width: _width ?? 24.w,
        ),
      ),
    );
  }
}
