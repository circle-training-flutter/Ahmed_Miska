import 'package:circletraning/data/providers/category_provider.dart';
import 'package:circletraning/data/providers/products_provider.dart';
import 'package:circletraning/data/providers/slider_image_provider.dart';
import 'package:circletraning/data/providers/subcategory_provider.dart';
import 'package:circletraning/data/providers/last_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/providers/shared_prefrance_provider.dart';
import 'core/di/injection.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;

  const GenerateMultiProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => getIt<SharedPref>()..loadCartItems()),
        ChangeNotifierProvider(
          create: (_) => getIt<LastProductsProvider>()..getProducts(context),
        ),
        ChangeNotifierProvider(
            create: (_) =>
                getIt<SliderImageProvider>()..sliderHomeRepo(context)),
        ChangeNotifierProvider(
            create: (_) => getIt<CategoryProvider>()..getCategoryy(context)),
        ChangeNotifierProvider(create: (_) => getIt<SubCategoryProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<ProductProvider>()),
      ],
      child: child,
    );
  }
}
