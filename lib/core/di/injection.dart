import 'package:circletraning/core/utils/dio_factory.dart';
import 'package:circletraning/data/providers/calculate_order_cost_provider.dart';
import 'package:circletraning/data/providers/city_provider.dart';
import 'package:circletraning/data/providers/my_orders_provider.dart';
import 'package:circletraning/data/providers/products_provider.dart';
import 'package:circletraning/data/providers/store_order_provider.dart';
import 'package:circletraning/data/repository/add_and_remove_favorites_repo.dart';
import 'package:circletraning/data/repository/calculate_order_cost_repo.dart';
import 'package:circletraning/data/repository/city_repo.dart';
import 'package:circletraning/data/repository/fevorite_item_repo.dart';
import 'package:circletraning/data/repository/login_repo.dart';
import 'package:circletraning/data/repository/my_orders_repo.dart';
import 'package:circletraning/data/repository/products_repo.dart';
import 'package:circletraning/data/repository/slider_repo.dart';
import 'package:circletraning/data/repository/store_order_repo.dart';
import 'package:circletraning/data/repository/sup_category_repo.dart';
import 'package:circletraning/data/providers/subcategory_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/providers/add_and_remove_favorite_provider.dart';
import '../../data/providers/category_provider.dart';
import '../../data/providers/fevorite_item_provider.dart';
import '../../data/providers/login_provider.dart';
import '../../data/providers/register_provider.dart';
import '../../data/providers/slider_image_provider.dart';
import '../../data/repository/register_repo.dart';
import '../../data/repository/save_user_data.dart';
import '../../data/repository/category_repo.dart';
import '../../data/repository/last_products_repo.dart';
import '../../data/datasource/remote/dio/api_service.dart';
import '../../data/providers/last_products_provider.dart';
import '../../data/providers/shared_prefrance_provider.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  Dio dio = DioFactory.getDio();
  final sharedPreferences = await SharedPreferences.getInstance();

  /// Services
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt(), getIt()));
  getIt.registerLazySingleton(() => SaveUserData(sharedPreferences: getIt(), apiService: getIt()));

  /// Providers
  getIt.registerLazySingleton<SharedPref>(() => SharedPref());
  getIt.registerLazySingleton<LastProductsProvider>(() => LastProductsProvider(getIt()));
  getIt.registerLazySingleton<SliderImageProvider>(() => SliderImageProvider(getIt()));
  getIt.registerLazySingleton<CategoryProvider>(() => CategoryProvider(getIt()));
  getIt.registerLazySingleton<SubCategoryProvider>(() => SubCategoryProvider(getIt()));
  getIt.registerLazySingleton<ProductProvider>(() => ProductProvider(getIt()));
  getIt.registerLazySingleton<FevoriteItemProvider>(() => FevoriteItemProvider(getIt()));
  getIt.registerLazySingleton<AddAndRemoveFavoritesProvider>(() => AddAndRemoveFavoritesProvider(getIt()));
  getIt.registerLazySingleton<CityProvider>(() => CityProvider(getIt()));
  getIt.registerLazySingleton<LoginProvider>(() => LoginProvider(loginRepo: getIt(), saveUserData: getIt()));
  getIt.registerLazySingleton<RegisterProvider>(() => RegisterProvider(registerRepo: getIt(), getIt()));
  getIt.registerLazySingleton<CalculateOrderCostProvider>(() => CalculateOrderCostProvider(calculateOrderCostRepo: getIt()));
  getIt.registerLazySingleton<StoreOrderProvider>(() => StoreOrderProvider(storeOrderRepo: getIt()));
  getIt.registerLazySingleton<MyOrdersProvider>(() => MyOrdersProvider(myOrdersRepo: getIt()));

  /// Repos
  getIt.registerLazySingleton<SliderRepo>(() => SliderRepo(getIt()));
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerLazySingleton<LastProductsRepo>(() => LastProductsRepo(getIt()));
  getIt.registerLazySingleton<SupCategoryRepo>(() => SupCategoryRepo(getIt()));
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
  getIt.registerFactory(() => LoginRepo(getIt(), getIt()));
  getIt.registerFactory(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<CityRepo>(() => CityRepo(getIt()));
  getIt.registerLazySingleton<FevoriteItemRepo>(() => FevoriteItemRepo(getIt()));
  getIt.registerLazySingleton<AddAndRemoveFavoritesRepo>(() => AddAndRemoveFavoritesRepo(getIt()));
  getIt.registerLazySingleton<CalculateOrderCostRepo>(() => CalculateOrderCostRepo(getIt()));
  getIt.registerLazySingleton<StoreOrderRepo>(() => StoreOrderRepo(getIt()));
  getIt.registerLazySingleton<MyOrdersRepo>(() => MyOrdersRepo(getIt()));
}
