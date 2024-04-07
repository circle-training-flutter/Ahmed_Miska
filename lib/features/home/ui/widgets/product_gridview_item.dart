import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/widgets/cached_network_image.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/heart_icon.dart';
import '../../../../data/models/response/product_model/product_datum.dart';
import '../../../../data/providers/add_and_remove_favorite_provider.dart';
import '../../../product_details/ui/product_details.dart';

class ProductGridviewItem extends StatefulWidget {
  final ProductModelItem productModel;
  final Function()? ontap;
  const ProductGridviewItem({
    super.key,
    this.ontap,
    required this.productModel,
  });

  @override
  State<ProductGridviewItem> createState() => _ProductGridviewItemState();
}

class _ProductGridviewItemState extends State<ProductGridviewItem> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    // Initialize the favorite status based on the initial value of the product model
    isFav = widget.productModel.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(ProductDetailsScreen(
          product: widget.productModel,
        ));
      },
      child: Container(
        // height: 191.33.h,
        // width: 167.5.w,
        decoration: BoxDecoration(
          color: ColorManger.grayMoreLight,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.productModel.isOffer!
                            ? Container(
                                decoration: BoxDecoration(
                                  color: ColorManger.red,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                                  child: Text(
                                    '${widget.productModel.offerValue} %',
                                    style: TextStyles.font14MadaRegularWith,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        HeartIcon(
                          onTap: () {
                            setState(() {
                              isFav = !isFav;
                            });
                            Provider.of<AddAndRemoveFavoritesProvider>(context, listen: false).addAndRemoveFavorite(
                              widget.productModel.id!,
                            );
                            widget.productModel.isFavorite = isFav;
                          },
                          checked: isFav,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                    width: double.infinity,
                    child: CachedImage(
                      image: widget.productModel.image!,
                    ),
                  ),
                ],
              ),
              Text(
                widget.productModel.title!,
                style: TextStyles.font14MadaRegularWith.copyWith(color: ColorManger.black),
              ).tr(),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.productModel.price.toString(),
                        style: TextStyles.font16MadaSemiBoldBlack,
                      ).tr(),
                      horizontalSpace(4),
                      Text(
                        'egp',
                        style: TextStyles.font10MadaRegularBlack,
                      ).tr(),
                    ],
                  ),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManger.red,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: SVGIcon(
                          AppIcons.addCartIcon,
                          height: 16.h,
                          width: 16.h,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
