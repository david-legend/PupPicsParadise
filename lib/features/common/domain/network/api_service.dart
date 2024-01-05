import 'package:dio/dio.dart';
import 'package:dog_images/features/common/domain/network/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service.g.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get({
    required String endPoint,
    String? baseUrl,
    dynamic data,
    dynamic params,
  }) async {
    Response response;
    if (baseUrl == null) {
      response = await _dio.get(endPoint, data: data, queryParameters: params);
    } else {
      response = await _dio.get(
        '$baseUrl$endPoint',
        data: data,
        queryParameters: params,
      );
    }
    return response;
  }

  Future<Response> post({
    required String endPoint,
    String? baseUrl,
    dynamic data,
    dynamic params,
  }) async {
    Response response;
    if (baseUrl == null) {
      response = await _dio.post(endPoint, data: data, queryParameters: params);
    } else {
      response = await _dio.post(
        '$baseUrl$endPoint',
        data: data,
        queryParameters: params,
      );
    }

    return response;
  }

  Future<Response> put({
    required String endPoint,
    String? baseUrl,
  }) async {
    Response response;
    if (baseUrl == null) {
      response = await _dio.put(endPoint);
    } else {
      response = await _dio.put('$baseUrl$endPoint');
    }
    return response;
  }

  Future<Response> delete({
    required String endPoint,
    String? baseUrl,
  }) async {
    Response response;
    if (baseUrl == null) {
      response = await _dio.delete(endPoint);
    } else {
      response = await _dio.delete('$baseUrl$endPoint');
    }
    return response;
  }
}

@Riverpod(keepAlive: true)
ApiService apiService(ApiServiceRef ref) {
  final dio = ref.read(dioProvider);
  return ApiService(dio);
}
