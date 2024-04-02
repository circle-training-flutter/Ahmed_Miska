import 'package:circletraning/features/category/ui/widgets/listview_of_category_in_category_screen.dart';
import 'package:circletraning/features/category/ui/widgets/listview_of_products_in_category_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  int selectedProductId = 44;

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
                // Pass the onProductSelected callback to ListViewOfCategoryInCategoryScreen
                ListViewOfCategoryInCategoryScreen(
                  onProductSelected: (productId) {
                    setState(() {
                      selectedProductId = productId;
                    });
                  },
                ),
                horizontalSpace(16),
                // Pass the selectedProductId to ListviewOfProductsInCategoryScreen
                ListviewOfProductsInCategoryScreen(
                  id: selectedProductId,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
