
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'item_of_categgory_prouduct.dart';

class ProductsGridViewInProductScreen extends StatefulWidget {
  const ProductsGridViewInProductScreen({
    super.key,
  });

  @override
  State<ProductsGridViewInProductScreen> createState() =>
      _ProductsGridViewInProductScreenState();
}

class _ProductsGridViewInProductScreenState
    extends State<ProductsGridViewInProductScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectIndex = index;
              });
            },
            child: ItemOfCategoryProuduct(
              isSelected: selectIndex == index,
            ),
          );
        },
      ),
    );
  }
}