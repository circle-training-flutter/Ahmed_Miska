import 'package:circletraning/data/models/response/product_model/product_datum.dart';
import 'package:circletraning/data/providers/add_and_remove_favorite_provider.dart';
import 'package:circletraning/data/providers/last_products_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/heart_icon.dart';

class RowOfNameAndfavorite extends StatefulWidget {
  final ProductModelItem product;

  const RowOfNameAndfavorite({
    super.key,
    required this.product,
  });

  @override
  State<RowOfNameAndfavorite> createState() => _RowOfNameAndfavoriteState();
}

class _RowOfNameAndfavoriteState extends State<RowOfNameAndfavorite> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 288.w,
          child: Text(
            widget.product.title!,
            style: TextStyles.font18MadaSemiBoldBlack.copyWith(color: ColorManger.red),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).tr(),
        ),
        const Spacer(),
        HeartIcon(
          checked: widget.product.isFavorite,
          onTap: () {
            setState(() {
              widget.product.isFavorite = !widget.product.isFavorite!;
            });
            Provider.of<AddAndRemoveFavoritesProvider>(context, listen: false).addAndRemoveFavorite(widget.product.id!);
            Provider.of<LastProductsProvider>(context, listen: false).updateFavoriteStatus(widget.product.id!, widget.product.isFavorite!);
          },
        ),
      ],
    );
  }
}
