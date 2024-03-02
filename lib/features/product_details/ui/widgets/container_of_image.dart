
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerOfImage extends StatelessWidget {
  const ContainerOfImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 234.h,
      width: double.infinity,
      child: Image.asset(
        'assets/images/pic3.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
