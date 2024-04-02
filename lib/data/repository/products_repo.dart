import 'package:circletraning/data/datasource/remote/dio/api_service.dart';
import 'package:dio/dio.dart';

import '../api_url/api_urls.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/response/base/api_response.dart';

class ProductsRepo {
  final ApiService apiService;

  ProductsRepo(this.apiService);
  Future<ApiResponse> getProduct({Map<String, dynamic>? query}) async {
    try {
      Response response =
          await apiService.get(endpoint: AppURL.product, query: query);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
