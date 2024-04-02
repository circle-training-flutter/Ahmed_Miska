import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/heart_icon.dart';

class RowOfNameAndfavorite extends StatelessWidget {
  final String title;
  const RowOfNameAndfavorite({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 288.w,
          child: Text(
            title,
            style: TextStyles.font18MadaSemiBoldBlack
                .copyWith(color: ColorManger.red),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).tr(),
        ),
        const Spacer(),
        const HeartIcon(),
      ],
    );
  }
}
