import 'package:circletraning/data/api_url/api_urls.dart';
import 'package:dio/dio.dart';

import '../datasource/remote/exception/api_error_handler.dart';
import '../models/response/base/api_response.dart';
import '../datasource/remote/dio/api_service.dart';

class CategoryRepo {
  final ApiService apiService;

  CategoryRepo(this.apiService);

  Future<ApiResponse> getCategoryy() async {
    try {
      Response response = await apiService.get(endpoint: AppURL.category);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  // Future<Either<Failure, List<CategoryModel>>> getCategory() async {
  //   try {
  //     var data = await apiService.get(endpoint: AppURL.category);
  //     List<CategoryModel> list = [];
  //     for (var item in data['data']) {
  //       list.add(CategoryModel.fromJson(item));
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
