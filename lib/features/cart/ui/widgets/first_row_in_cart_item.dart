import 'package:circletraning/core/widgets/cached_network_image.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../data/models/response/product_model/product_datum.dart';

class FirstRowInCartItem extends StatelessWidget {
  final ProductModelItem product;
  final Function()? onTap;

  const FirstRowInCartItem({
    super.key,
    this.onTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 66.67.h,
          width: 100.w,
          child: CachedImage(
            image: product.image!,
          ),
        ),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 180.w,
              child: Text(
                product.title!,
                style: TextStyles.font14MadaRegularBlack,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ).tr(),
            ),
            Row(
              children: [
                SVGIcon(AppIcons.priceIcon),
                horizontalSpace(4),
                Text(
                  product.price.toString(),
                  style: TextStyles.font16MadaSemiBoldBlack,
                ).tr(),
                horizontalSpace(4),
                Text(
                  'egp',
                  style: TextStyles.font12MadaRegularBlack,
                ).tr(),
              ],
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: GestureDetector(
            onTap: onTap,
            child: SVGIcon(
              AppIcons.deleteIcon,
            ),
          ),
        )
      ],
    );
  }
}
