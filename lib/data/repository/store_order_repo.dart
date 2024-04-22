import 'package:circletraning/data/api_url/api_urls.dart';
import 'package:circletraning/data/datasource/remote/dio/api_service.dart';
import 'package:circletraning/data/datasource/remote/exception/api_error_handler.dart';
import 'package:circletraning/data/models/body/store_order_request_model.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class StoreOrderRepo {
  final ApiService apiService;

  StoreOrderRepo(this.apiService);

  Future<ApiResponse> storeOrder(StoreOrderRequestModel requestBody) async {
    try {
      Response response = await apiService.post(
        AppURL.storeOrder,
        data: requestBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
