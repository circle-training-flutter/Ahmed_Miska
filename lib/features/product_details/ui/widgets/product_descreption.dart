import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class ProductDescription extends StatelessWidget {
  final String description;
  const ProductDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyles.font12MadaRegularGray,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
    ).tr();
  }
}
