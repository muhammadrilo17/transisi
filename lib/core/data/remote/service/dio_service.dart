import 'package:dio/dio.dart';

class DioService {
  final Dio _dio;

  DioService(this._dio);

  Future<Response> post(String endpoint, Map<String, dynamic>? data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getByParams(
      String endpoint, Map<String, dynamic>? queryParams) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getById(String endpoint, int id) async {
    try {
      final response = await _dio.get('$endpoint/$id');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
