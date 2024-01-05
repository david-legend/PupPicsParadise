import 'package:dog_images/features/common/domain/network/api_service.dart';
import 'package:dog_images/features/common/domain/network/api_urls.dart';
import 'package:dog_images/features/dogs_list/data/dtos/all_dog_breeds_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_images_remote_data_source.g.dart';

class DogImagesRemoteDataSource {
  final ApiService _apiService;

  DogImagesRemoteDataSource(this._apiService);

  Future<AllDogBreedsDto> getAllDogBreeds() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final response = await _apiService.get(endPoint: Api.allBreeds);
      if (response.statusCode == 200) {
        final responseData = AllDogBreedsDto.fromJson(response.data);
        debugPrint("getAllDogBreeds result:: ${responseData.toString()}");
        return responseData;
      }

      throw '';
    } catch (e) {
      debugPrint("getAllDogBreeds:: ${e.toString()}");
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
DogImagesRemoteDataSource dogImagesRemoteDataSource(
    DogImagesRemoteDataSourceRef ref) {
  final apiService = ref.watch(apiServiceProvider);
  return DogImagesRemoteDataSource(apiService);
}
