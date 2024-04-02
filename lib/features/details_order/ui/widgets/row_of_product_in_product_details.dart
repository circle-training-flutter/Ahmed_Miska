import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../data/models/response/product_model/product_datum.dart';

class RowOfProductsInProductDetails extends StatelessWidget {
  final ProductModelItem product;
  const RowOfProductsInProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: SizedBox(
            width: 210.w,
            child: Text(
              product.title!,
              style: TextStyles.font14MadaRegularBlack,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ).tr(),
          ),
        ),
        const Spacer(),
        Text(
          ' X ${product.weightUnit!}',
          style: TextStyles.font14MadaRegularBlack
              .copyWith(color: ColorManger.gray),
        ),
        horizontalSpace(12),
        Text(
          '${product.price! * product.weightUnit!}',
          style: TextStyles.font16MadaSemiBoldBlack,
        ).tr(),
        horizontalSpace(4),
        Text(
          'egp',
          style: TextStyles.font12MadaRegularGray,
        ).tr()
      ],
    );
  }
}
