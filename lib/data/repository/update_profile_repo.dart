import 'package:circletraning/data/api_url/api_urls.dart';
import 'package:circletraning/data/datasource/remote/dio/api_service.dart';
import 'package:circletraning/data/datasource/remote/exception/api_error_handler.dart';
import 'package:circletraning/data/models/body/update_profile_request_mpdel.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:dio/dio.dart';

class UpdateProfileRepo {
  final ApiService apiService;
  final SaveUserData saveUserData;

  UpdateProfileRepo(this.saveUserData, this.apiService);
  Future<ApiResponse> updateProfile(UpdateProfileRequestModel model) async {
    try {
      Response response = await apiService.post(
        AppURL.updateProfile,
        data: model.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
