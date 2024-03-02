import 'package:circletraning/core/routing/routes.dart';
import 'package:circletraning/features/category/ui/category_screen.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:circletraning/features/product/ui/products_screen.dart';
import 'package:circletraning/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case Routes.category:
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
        );
      case Routes.products:
        return MaterialPageRoute(
          builder: (_) => const ProductsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
