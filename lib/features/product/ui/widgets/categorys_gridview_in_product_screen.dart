import 'package:circletraning/data/providers/category_provider.dart';
import 'package:circletraning/features/product/ui/widgets/prouduct_item_of_prouducts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/colors.dart';

class CategorysGridViewInProductScreen extends StatefulWidget {
  final int index;
  final void Function(int productI, int subcatId) onProductSelected;
  const CategorysGridViewInProductScreen({
    super.key,
    required this.index,
    required this.onProductSelected,
  });

  @override
  State<CategorysGridViewInProductScreen> createState() =>
      _CategorysGridViewInProductScreenState();
}

class _CategorysGridViewInProductScreenState
    extends State<CategorysGridViewInProductScreen> {
  @override
  void initState() {
    selectIndex = widget.index;
    super.initState();
  }

  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(color: ColorManger.red.withOpacity(.05)),
      child: Consumer<CategoryProvider>(builder: (context, provider, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          itemCount: provider.categoryModelList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = index;
                });
                widget.onProductSelected(
                  provider.categoryModelList[index].id!,
                  provider
                      .categoryModelList[index]
                      .subCategories![provider
                              .categoryModelList[index].subCategories!.length -
                          1]
                      .id!,
                );
              },
              child: ProuductItemofProuductsScreen(
                item: provider.categoryModelList[index],
                isSelected: selectIndex == index,
              ),
            );
          },
        );
      }),
    );
  }
}
