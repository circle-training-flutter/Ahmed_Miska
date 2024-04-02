import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://ecommerce.project-nami.xyz/api/user/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get(
      {required String endpoint, Map<String, dynamic>? query}) async {
    try {
      var response =
          await _dio.get('$_baseUrl$endpoint', queryParameters: query);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
