import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/styles.dart';

class ContainerOfRowOfSetting extends StatelessWidget {
  final String text;
  final String image;
  const ContainerOfRowOfSetting({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 97.h,
      width: 103.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(image),
          Text(
            text,
            style: TextStyles.font16MadaSemiBoldBlack,
          ).tr()
        ],
      ),
    );
  }
}
