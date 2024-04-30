import 'package:circletraning/data/api_url/api_urls.dart';
import 'package:circletraning/data/datasource/remote/dio/api_service.dart';
import 'package:circletraning/data/datasource/remote/exception/api_error_handler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class MyPointsRepo {
  final ApiService apiService;

  MyPointsRepo(this.apiService);
  Future <ApiResponse> getMyPoints() async
  {
     try {
      Response response = await apiService.get(endpoint: AppURL.myPoints);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
