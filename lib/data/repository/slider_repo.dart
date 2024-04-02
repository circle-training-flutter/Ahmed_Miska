import 'package:circletraning/data/api_url/api_urls.dart';
import 'package:circletraning/data/datasource/remote/exception/api_error_handler.dart';
import 'package:dio/dio.dart';

import '../models/response/base/api_response.dart';
import '../datasource/remote/dio/api_service.dart';

class SliderRepo {
  final ApiService apiService;

  SliderRepo(this.apiService);

  Future<ApiResponse> sliderHomeRepo() async {
    try {
      Response response = await apiService.get(endpoint: AppURL.slider);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
