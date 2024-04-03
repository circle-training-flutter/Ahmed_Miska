import 'package:circletraning/data/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../data/providers/shared_prefrance_provider.dart';
import '../../../home/ui/widgets/product_gridview_item.dart';

class ListViewOfProductinProductScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String text;

  const ListViewOfProductinProductScreen({
    Key? key,
    required this.catId,
    required this.subCatId, required this.text,
  }) : super(key: key);

  @override
  State<ListViewOfProductinProductScreen> createState() => _ListViewOfProductinProductScreenState();
}

class _ListViewOfProductinProductScreenState extends State<ListViewOfProductinProductScreen> {
  SharedPref sharedPref = getIt();

  @override
  void initState() {
    super.initState();
    _updateCategoryList(widget.catId, widget.subCatId,widget.text); // Call the method to fetch data
  }

  @override
  void didUpdateWidget(covariant ListViewOfProductinProductScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the ID has changed, and if so, update the category list
    if (widget.catId != oldWidget.catId || widget.subCatId != oldWidget.subCatId|| widget.text != oldWidget.text) {
      _updateCategoryList(widget.catId, widget.subCatId,widget.text);
    }
  }

  // Method to update the category list
  void _updateCategoryList(int catId, int subCatId,String textt) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).getProducts(context, query: {
        'category_id': catId,
        'sub_category_id': subCatId,
        'title': textt
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: (191.33.h + 12.h) * ceil(5, 2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            if (provider.isFailure) {
              return CustomErrorWidget(
                errMessage: provider.productfailure.errMessage,
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.isLoading ? 4 : provider.productModelList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 12.h,
              ),
              itemBuilder: (context, index) {
                if (provider.isLoading) {
                  return LoadingWidget(
                    height: 50.h,
                  );
                }
                return ProductGridviewItem(
                  ontap: () {
                    sharedPref.addToCart(
                      provider.productModelList[index],
                      context,
                      fromHome: true,
                    );
                  },
                  productModel: provider.productModelList[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
