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
      FormData formData = FormData.fromMap({
        "first_name": requestBody.firstName,
        "last_name": requestBody.lastName,
        "phone_code": requestBody.phoneCode,
        "phone": requestBody.phone,
        "image": requestBody.image == null ? null : await MultipartFile.fromFile(requestBody.image!.path),
        "invitation_code": requestBody.invitationCode,
        "city_id": requestBody.cityId,
      });

      Response response = await apiService.postWithImage(AppURL.register, data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      // Handle errors
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
