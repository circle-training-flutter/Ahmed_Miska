import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/features/category/ui/widgets/category_of_category_screen.dart';
import 'package:circletraning/features/category/ui/widgets/product_of_category.dart';
import 'package:circletraning/features/product/ui/products_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.5.h),
            child: Text(
              'category',
              style: TextStyles.font18MadaSemiBoldBlack,
            ).tr(),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 102.w,
                  decoration: BoxDecoration(
                    color: ColorManger.grayMoreLight,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: const CategoryocCatScreen(),
                      );
                    },
                    itemCount: 8,
                  ),
                ),
                horizontalSpace(16),
                Flexible(
                  child: ListView.builder(
                    // physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: GestureDetector(
                          onTap: () {
                            push(const ProductsScreen());
                          },
                          child: const ProductOfCategory(),
                        ),
                      );
                    },
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
