import 'package:circletraning/features/product/ui/widgets/prouduct_item_of_prouducts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class CategorysGridViewInProductScreen extends StatefulWidget {
  const CategorysGridViewInProductScreen({
    super.key,
  });

  @override
  State<CategorysGridViewInProductScreen> createState() =>
      _CategorysGridViewInProductScreenState();
}

class _CategorysGridViewInProductScreenState
    extends State<CategorysGridViewInProductScreen> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(color: ColorManger.red.withOpacity(.05)),
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
            child: ProuductItemofProuductsScreen(
              isSelected: selectIndex == index,
            ),
          );
        },
      ),
    );
  }
}
