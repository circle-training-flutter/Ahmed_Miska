import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';
import '../api_url/api_urls.dart';
import '../datasource/remote/dio/api_service.dart';
import '../datasource/remote/exception/api_error_handler.dart';

class CityRepo {
  final ApiService apiService;

  CityRepo(this.apiService);

  Future<ApiResponse> getCity() async {
    try {
      Response response = await apiService.get(endpoint: AppURL.getCity);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
