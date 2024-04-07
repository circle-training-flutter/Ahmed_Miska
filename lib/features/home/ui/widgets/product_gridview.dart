import 'package:circletraning/core/widgets/loading_widget.dart';
import 'package:circletraning/data/providers/last_products_provider.dart';
import 'package:circletraning/features/home/ui/widgets/product_gridview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../data/providers/shared_prefrance_provider.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/custom_error_widget.dart';

class ProductGridview extends StatefulWidget {
  const ProductGridview({
    super.key,
  });

  @override
  State<ProductGridview> createState() => _ProductGridviewState();
}

class _ProductGridviewState extends State<ProductGridview> {
  SharedPref sharedPref = getIt();
  @override
  Widget build(BuildContext context) {
    // Provider.of<LastProductsProvider>(context).getProducts();
    return SizedBox(
      // height: (191.33.h + 12.h) * ceil(8,2),
      // width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Consumer<LastProductsProvider>(
          builder: (context, homeProvider, child) {
            if (homeProvider.isFailure) {
              return CustomErrorWidget(errMessage: homeProvider.productfailure.errMessage);
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeProvider.isLoading ? 2 : homeProvider.productModelList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 12.h,
              ),
              itemBuilder: (context, index) {
                return homeProvider.isLoading
                    ? const LoadingWidget()
                    : ProductGridviewItem(
                        productModel: homeProvider.productModelList[index],
                        ontap: () {
                          sharedPref.addToCart(
                            homeProvider.productModelList[index],
                            context,
                            fromHome: true,
                          );
                        },
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
