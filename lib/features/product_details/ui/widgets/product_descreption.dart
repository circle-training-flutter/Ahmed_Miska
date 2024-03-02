import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'product_description',
      style: TextStyles.font12MadaRegularGray,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
    ).tr();
  }
}
