import 'package:dio/dio.dart';
import 'package:dog_images/features/common/domain/network/api_urls.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  return Dio()
    ..options.headers['Content-Type'] = 'application/json'
    ..options.baseUrl = Api.baseUrl;
}
