import 'package:dio/dio.dart';

import '../api_url/api_urls.dart';
import '../datasource/remote/dio/api_service.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/response/base/api_response.dart';

class FevoriteItemRepo {
  final ApiService apiService;

  FevoriteItemRepo(this.apiService);
  Future<ApiResponse> getFevoriteItem() async {
    try {
      Response response = await apiService.get(endpoint: AppURL.fevoriteItem,);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}