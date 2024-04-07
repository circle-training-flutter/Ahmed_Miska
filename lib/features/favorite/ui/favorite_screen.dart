import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/widgets/custom_error_widget.dart';
import 'package:circletraning/data/providers/fevorite_item_provider.dart';
import 'package:circletraning/data/providers/last_products_provider.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../home/ui/widgets/product_gridview_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    if (!_isInitialized) {
      Provider.of<FevoriteItemProvider>(context).getProducts(context);
      _isInitialized = true;
    }
    super.didChangeDependencies();
  }

  // @override
  // void dispose() {
  //   Provider.of<LastProductsProvider>(context, listen: true).getProducts();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final ddd = Provider.of<LastProductsProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarOfReturnedScreens(
              title: 'favorite',
              onTap: () {
                ddd.getProducts();
                pop();
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Consumer<FevoriteItemProvider>(builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (provider.isFailure) {
                      return CustomErrorWidget(errMessage: provider.productfailure.errMessage);
                    }
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.fevoriteproductModelList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .75,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 12.h,
                      ),
                      itemBuilder: (context, index) {
                        return ProductGridviewItem(
                          productModel: provider.fevoriteproductModelList[index],
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
