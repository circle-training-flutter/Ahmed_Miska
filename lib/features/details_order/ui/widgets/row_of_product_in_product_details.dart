import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class RowOfProductsInProductDetails extends StatelessWidget {
  const RowOfProductsInProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('salmon', style: TextStyles.font14MadaRegularBlack).tr(),
        const Spacer(),
        Text(
          ' X 1',
          style: TextStyles.font14MadaRegularBlack
              .copyWith(color: ColorManger.gray),
        ),
        horizontalSpace(12),
        Text('price', style: TextStyles.font16MadaRegularBlack).tr(),
        horizontalSpace(4),
        Text(
          'egp',
          style: TextStyles.font12MadaRegularGray,
        ).tr()
      ],
    );
  }
}
