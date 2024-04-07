import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:dio/dio.dart';

import '../api_url/api_urls.dart';
import '../datasource/remote/dio/api_service.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/body/login_request_model.dart';
import '../models/response/base/api_response.dart';

class LoginRepo {
  final ApiService apiService;
  final SaveUserData saveUserData;

  LoginRepo(this.apiService, this.saveUserData);
  Future<ApiResponse> login(LoginRequestBody requestBody) async {
    try {
      Response response = await apiService.post(
        AppURL.login,
        data: requestBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
