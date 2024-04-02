import 'package:circletraning/data/api_url/api_urls.dart';
import 'package:circletraning/data/datasource/remote/dio/api_service.dart';
import 'package:dio/dio.dart';

import '../datasource/remote/exception/api_error_handler.dart';
import '../models/response/base/api_response.dart';

class LastProductsRepo {
  final ApiService apiService;

  LastProductsRepo(this.apiService);

  Future<ApiResponse> getProducts() async {
    try {
      Response response = await apiService.get(endpoint: AppURL.lastProduct);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Future<Either<Failure, List<ProductModel>>> getProducts() async {
  //   try {
  //     var data = await apiService.get(endpoint: AppURL.lastProduct);
  //     List<ProductModel> list = [];
  //     for (var item in data['data']) {
  //       list.add(ProductModel.fromJson(item));
  //     }
  //     return Right(list);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return Left(ServerFailure.fromDioError(e));
  //     }

  //     return Left(ServerFailure(e.toString()));
  //   }
  // }
}
