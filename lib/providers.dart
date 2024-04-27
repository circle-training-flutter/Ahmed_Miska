import 'package:circletraning/data/providers/calculate_order_cost_provider.dart';
import 'package:circletraning/data/providers/category_provider.dart';
import 'package:circletraning/data/providers/fevorite_item_provider.dart';
import 'package:circletraning/data/providers/login_provider.dart';
import 'package:circletraning/data/providers/my_orders_provider.dart';
import 'package:circletraning/data/providers/products_provider.dart';
import 'package:circletraning/data/providers/register_provider.dart';
import 'package:circletraning/data/providers/slider_image_provider.dart';
import 'package:circletraning/data/providers/store_order_provider.dart';
import 'package:circletraning/data/providers/subcategory_provider.dart';
import 'package:circletraning/data/providers/last_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/providers/add_and_remove_favorite_provider.dart';
import 'data/providers/city_provider.dart';
import 'data/providers/shared_prefrance_provider.dart';
import 'core/di/injection.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;

  const GenerateMultiProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<SharedPref>()..loadCartItems()),
        ChangeNotifierProvider(
          create: (_) => getIt<LastProductsProvider>()..getProducts(),
        ),
        ChangeNotifierProvider(create: (_) => getIt<SliderImageProvider>()..sliderHomeRepo()),
        ChangeNotifierProvider(create: (_) => getIt<CategoryProvider>()..getCategoryy()),
        ChangeNotifierProvider(create: (_) => getIt<SubCategoryProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<ProductProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<LoginProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<CityProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<RegisterProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<FevoriteItemProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<AddAndRemoveFavoritesProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<CalculateOrderCostProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<StoreOrderProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<MyOrdersProvider>()),
      ],
      child: child,
    );
  }
}
