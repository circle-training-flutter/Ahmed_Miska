import 'package:circletraning/core/helpers/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/heart_icon.dart';
import '../../../product_details/ui/product_details.dart';

class ProductGridviewItem extends StatelessWidget {
  const ProductGridviewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(const ProductDetailsScreen());
      },
      child: Container(
        height: 191.33.h,
        width: 167.5.w,
        decoration: BoxDecoration(
          color: ColorManger.grayMoreLight,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 106.33.h,
                width: 151.5.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.pic3),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorManger.red,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 2.h),
                          child: Text(
                            '15 %',
                            style: TextStyles.font14MadaRegularWith,
                          ),
                        ),
                      ),
                      const HeartIcon()
                    ],
                  ),
                ),
              ),
              Text(
                'salmon',
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
                        'price',
                        style: TextStyles.font16MadaSemiBoldBlack,
                      ).tr(),
                      horizontalSpace(4),
                      Text(
                        'egp',
                        style: TextStyles.font10MadaRegularBlack,
                      ).tr(),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManger.red,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: SvgPicture.asset(
                        AppIcons.addCartIcon,
                        height: 12.h,
                        width: 12.w,
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
