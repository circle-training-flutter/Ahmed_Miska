import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../product/ui/products_screen.dart';
import '../../../../data/providers/subcategory_provider.dart';
import '../widgets/product_of_category.dart'; // Adjust import path as needed

class ListviewOfProductsInCategoryScreen extends StatefulWidget {
  final int id;

  const ListviewOfProductsInCategoryScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ListviewOfProductsInCategoryScreen> createState() =>
      _ListviewOfProductsInCategoryScreenState();
}

class _ListviewOfProductsInCategoryScreenState
    extends State<ListviewOfProductsInCategoryScreen> {
  @override
  void initState() {
    super.initState();
    _updateCategoryList(widget.id); // Call the method to fetch data
  }

  @override
  void didUpdateWidget(covariant ListviewOfProductsInCategoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the ID has changed, and if so, update the category list
    if (widget.id != oldWidget.id) {
      _updateCategoryList(widget.id);
    }
  }

  // Method to update the category list
  void _updateCategoryList(int id) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SubCategoryProvider>(context, listen: false)
          .getsubCategory(context, id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<SubCategoryProvider>(
        builder: (context, provider, child) {
          if (provider.isFailure) {
            return CustomErrorWidget(
              errMessage: provider.subCatfailure.errMessage,
            );
          }
          // Check if subCategoryList is empty before fetching data
          if (provider.subCategoryList.isEmpty) {
            return LoadingWidget(height: 50.h);
          }

          return ListView.builder(
            // physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: GestureDetector(
                  onTap: () {
                    push(const ProductsScreen(
                      index: 0,
                    ));
                  },
                  child: ProductOfCategory(
                    subCategory: provider.subCategoryList[index],
                  ),
                ),
              );
            },
            itemCount: provider.isloading ? 1 : provider.subCategoryList.length,
          );
        },
      ),
    );
  }
}
