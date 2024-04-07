import 'package:circletraning/data/models/response/base/api_response.dart';

import '../api_url/api_urls.dart';
import '../datasource/remote/dio/api_service.dart';
import '../datasource/remote/exception/api_error_handler.dart';

class AddAndRemoveFavoritesRepo {
  final ApiService apiService;

  AddAndRemoveFavoritesRepo(this.apiService);
  Future<ApiResponse> addAndRemoveFavoritesRepo(int productID) async {
    try {
      var response = await apiService.post(
        AppURL.addAndRemoveFavorites,
        queryParameters: {'product_id': productID},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
