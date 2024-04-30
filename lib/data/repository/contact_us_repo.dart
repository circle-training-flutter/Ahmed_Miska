import 'package:circletraning/data/api_url/api_urls.dart';
import 'package:circletraning/data/datasource/remote/dio/api_service.dart';
import 'package:circletraning/data/datasource/remote/exception/api_error_handler.dart';
import 'package:circletraning/data/models/body/contact_us_request_model.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class ContactUsRepo {
  final ApiService apiService;

  ContactUsRepo(this.apiService);

  Future<ApiResponse> getContactUs(ContactUsRequestModel requestBody) async {
    try {
      Response response = await apiService.post(
        AppURL.contactUs,
        data: requestBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
