import 'package:dio/dio.dart';

import '../api_url/api_urls.dart';
import '../datasource/remote/dio/api_service.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/body/register_request_model.dart';
import '../models/response/base/api_response.dart';

class RegisterRepo {
  final ApiService apiService;

  RegisterRepo(this.apiService);

  Future<ApiResponse> register(RegisterRequestBody requestBody) async {
    try {
      Response response = await apiService.postWithImage(
        AppURL.register,
        data: requestBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      // Handle errors
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
