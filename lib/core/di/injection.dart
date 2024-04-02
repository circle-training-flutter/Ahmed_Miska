import 'package:circletraning/core/utils/dio_factory.dart';
import 'package:circletraning/data/providers/products_provider.dart';
import 'package:circletraning/data/repository/products_repo.dart';
import 'package:circletraning/data/repository/slider_repo.dart';
import 'package:circletraning/data/repository/sup_category_repo.dart';
import 'package:circletraning/data/providers/subcategory_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/providers/category_provider.dart';
import '../../data/providers/slider_image_provider.dart';
import '../../data/repository/category_repo.dart';
import '../../data/repository/last_products_repo.dart';
import '../../data/datasource/remote/dio/api_service.dart';
import '../../data/providers/last_products_provider.dart';
import '../../data/providers/shared_prefrance_provider.dart';

final getIt = GetIt.instance;

void init() {
  Dio dio = DioFactory.getDio();

  /// Services
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  /// Providers
  getIt.registerLazySingleton<SharedPref>(() => SharedPref());
  getIt.registerLazySingleton<LastProductsProvider>(
      () => LastProductsProvider(getIt()));
  getIt.registerLazySingleton<SliderImageProvider>(
      () => SliderImageProvider(getIt()));
  getIt
      .registerLazySingleton<CategoryProvider>(() => CategoryProvider(getIt()));
  getIt.registerLazySingleton<SubCategoryProvider>(
      () => SubCategoryProvider(getIt()));
  getIt.registerLazySingleton<ProductProvider>(() => ProductProvider(getIt()));

  /// Repos
  getIt.registerLazySingleton<SliderRepo>(() => SliderRepo(getIt()));
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt
      .registerLazySingleton<LastProductsRepo>(() => LastProductsRepo(getIt()));
  getIt.registerLazySingleton<SupCategoryRepo>(() => SupCategoryRepo(getIt()));
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
}
