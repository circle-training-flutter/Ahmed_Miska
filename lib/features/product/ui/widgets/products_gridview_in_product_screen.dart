import 'package:circletraning/data/providers/subcategory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import 'item_of_categgory_prouduct.dart';

class ProductsGridViewInProductScreen extends StatefulWidget {
  final void Function(int productId) onProductSelected;

  final int id;
  const ProductsGridViewInProductScreen({
    super.key,
    required this.id,
    required this.onProductSelected,
  });

  @override
  State<ProductsGridViewInProductScreen> createState() =>
      _ProductsGridViewInProductScreenState();
}

class _ProductsGridViewInProductScreenState
    extends State<ProductsGridViewInProductScreen> {
  @override
  void initState() {
    super.initState();
    _updateCategoryList(widget.id); // Call the method to fetch data
  }

  @override
  void didUpdateWidget(covariant ProductsGridViewInProductScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the ID has changed, and if so, update the category list
    if (widget.id != oldWidget.id) {
      _updateCategoryList(widget.id);
    }
  }

  // Method to update the category list
  void _updateCategoryList(int id) {
    selectIndex = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SubCategoryProvider>(context, listen: false)
          .getsubCategory(context, id);
    });
  }

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: Consumer<SubCategoryProvider>(builder: (context, provider, child) {
        if (provider.isFailure) {
          return CustomErrorWidget(
            errMessage: provider.subCatfailure.errMessage,
          );
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: provider.isloading ? 1 : provider.subCategoryList.length,
          itemBuilder: (context, index) {
            if (provider.isloading) {
              return LoadingWidget(
                width: 100.w,
              );
            }
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = index;
                });
                widget.onProductSelected(provider.subCategoryList[index].id!);
              },
              child: ItemOfCategoryProuduct(
                item: provider.subCategoryList[index],
                isSelected: selectIndex == index,
              ),
            );
          },
        );
      }),
    );
  }
}
