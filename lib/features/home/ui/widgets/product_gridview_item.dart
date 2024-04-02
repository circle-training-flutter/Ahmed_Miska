import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/widgets/cached_network_image.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/heart_icon.dart';
import '../../../../data/models/response/product_model/product_datum.dart';
import '../../../product_details/ui/product_details.dart';

class ProductGridviewItem extends StatelessWidget {
  final ProductModelItem productModel;

  final Function()? ontap;
  const ProductGridviewItem({
    super.key,
    this.ontap,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(ProductDetailsScreen(
          product: productModel,
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
                        productModel.isOffer!
                            ? Container(
                                decoration: BoxDecoration(
                                  color: ColorManger.red,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.w, vertical: 2.h),
                                  child: Text(
                                    '${productModel.offerValue} %',
                                    style: TextStyles.font14MadaRegularWith,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const HeartIcon()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                    width: double.infinity,
                    child: CachedImage(
                      image: productModel.image!,
                    ),
                  ),
                ],
              ),
              Text(
                productModel.title!,
                style: TextStyles.font14MadaRegularWith
                    .copyWith(color: ColorManger.black),
              ).tr(),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        productModel.price.toString(),
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
                    onTap: ontap,
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
