import 'package:dio/dio.dart';

class ApiManager {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  
  ApiManager(this._dio);
  Future<Map<String, dynamic>> get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    Response response =
        await _dio.get(_baseUrl + endPoint, queryParameters: queryParameters);
    return response.data;
  }
}

