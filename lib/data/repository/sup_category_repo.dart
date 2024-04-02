import 'package:circletraning/data/api_url/api_urls.dart';
import 'package:dio/dio.dart';

import '../datasource/remote/exception/api_error_handler.dart';
import '../models/response/base/api_response.dart';
import '../datasource/remote/dio/api_service.dart';

class SupCategoryRepo {
  final ApiService apiService;

  SupCategoryRepo(this.apiService);

  Future<ApiResponse> getSubCategory(int id) async {
    try {
      Response response =
          await apiService.get(endpoint: '${AppURL.subCategory}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Future<Either<Failure, List<SubCategoryModel>>> getSubCategory(int id) async {
  //   try {
  //     var data = await apiService.get(endpoint: '${AppURL.subCategory}/$id');
  //     List<SubCategoryModel> list = [];
  //     for (var item in data['data']) {
  //       list.add(SubCategoryModel.fromJson(item));
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
