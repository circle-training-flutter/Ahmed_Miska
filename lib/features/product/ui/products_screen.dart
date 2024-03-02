import 'package:circletraning/features/product/ui/widgets/categorys_gridview_in_product_screen.dart';
import 'package:circletraning/features/product/ui/widgets/products_gridview_in_product_screen.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/search_bar.dart';
import '../../home/ui/widgets/product_gridview_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

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
                              child: const SearchBaar(),
                            ),
                          ),
                          verticalSpace(8),
                          const CategorysGridViewInProductScreen(),
                          verticalSpace(8),
                          const ProductsGridViewInProductScreen()
                        ],
                      ),
                    ),
                    verticalSpace(16),
                    SizedBox(
                      // height: (191.33.h + 12.h) * ceil(5, 2),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 167.5.w / 191.33.h,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 12.h,
                          ),
                          itemBuilder: (context, index) {
                            return const ProductGridviewItem();
                          },
                        ),
                      ),
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
