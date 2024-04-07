import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/widgets/search_bar.dart';
import 'package:circletraning/data/providers/category_provider.dart';
import 'package:circletraning/features/product/ui/widgets/categorys_gridview_in_product_screen.dart';
import 'package:circletraning/features/product/ui/widgets/listview_of_products_in_products_screen.dart';
import 'package:circletraning/features/product/ui/widgets/products_gridview_in_product_screen.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  final int? index;
  final int? subIndex;

  const ProductsScreen({Key? key, this.index, this.subIndex}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selectedProductId = 0;
  int subcatId = 0;
  TextEditingController controller = TextEditingController();
  String text = '';

  @override
  void didChangeDependencies() {
    selectedProductId = Provider.of<CategoryProvider>(context).categoryModelList[widget.index!].id!;
    subcatId = Provider.of<CategoryProvider>(context)
        .categoryModelList[widget.index!]
        .subCategories![Provider.of<CategoryProvider>(context).categoryModelList[widget.index!].subCategories!.length - 1]
        .id!;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'prouducts'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 196.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: SizedBox(
                              height: 54.h,
                              child: SearchBaar(
                                controller: controller,
                                onChanged: (p0) {
                                  setState(() {
                                    text = p0;
                                  });
                                },
                              ),
                            ),
                          ),
                          verticalSpace(8),
                          CategorysGridViewInProductScreen(
                            index: widget.index!,
                            onProductSelected: (int productId, int subcatIdd) {
                              setState(
                                () {
                                  selectedProductId = productId;
                                  subcatId = subcatIdd;
                                },
                              );
                            },
                          ),
                          verticalSpace(8),
                          ProductsGridViewInProductScreen(
                            index: widget.subIndex ?? 0,
                            id: selectedProductId,
                            onProductSelected: (int productId) {
                              setState(
                                () {
                                  subcatId = productId;
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    verticalSpace(16),
                    ListViewOfProductinProductScreen(
                      catId: selectedProductId,
                      subCatId: subcatId,
                      text: text,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
