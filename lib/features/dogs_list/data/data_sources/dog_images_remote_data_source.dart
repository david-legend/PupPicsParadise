import 'package:dog_images/features/common/domain/network/api_service.dart';
import 'package:dog_images/features/common/domain/network/api_urls.dart';
import 'package:dog_images/features/dogs_list/data/dtos/all_dog_breeds_dto.dart';
import 'package:dog_images/features/dogs_list/data/dtos/dog_images_list_dto.dart';
import 'package:dog_images/features/dogs_list/data/dtos/dog_random_image_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_images_remote_data_source.g.dart';

class DogImagesRemoteDataSource {
  final ApiService _apiService;

  DogImagesRemoteDataSource(this._apiService);

  Future<AllDogBreedsDto> getAllDogBreeds() async {
    try {
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

  Future<DogRandomImageDto> getDogRandomImageByBreed(String breed) async {
    try {
      final response =
          await _apiService.get(endPoint: Api.randomImageByBreed(breed));
      if (response.statusCode == 200) {
        final responseData = DogRandomImageDto.fromJson(response.data);
        debugPrint(
            "getDogRandomImageByBreed result:: ${responseData.toString()}");
        return responseData;
      }

      throw '';
    } catch (e) {
      debugPrint("getDogRandomImageByBreed:: ${e.toString()}");
      rethrow;
    }
  }

  Future<DogImagesLisDto> getDogImageListByBreed(String breed) async {
    try {
      final response =
          await _apiService.get(endPoint: Api.imageListByBreed(breed));
      if (response.statusCode == 200) {
        final responseData = DogImagesLisDto.fromJson(response.data);
        debugPrint(
            "getDogImageListByBreed result:: ${responseData.toString()}");
        return responseData;
      }

      throw '';
    } catch (e) {
      debugPrint("getDogImageListByBreed:: ${e.toString()}");
      rethrow;
    }
  }

  Future<DogRandomImageDto> getDogRandomImageBySubBreed({
    required String breed,
    required String subBreed,
  }) async {
    try {
      final response = await _apiService.get(
        endPoint: Api.randomImageBySubBreed(breed, subBreed),
      );
      if (response.statusCode == 200) {
        final responseData = DogRandomImageDto.fromJson(response.data);
        debugPrint(
            "getDogRandomImageBySubBreed result:: ${responseData.toString()}");
        return responseData;
      }

      throw '';
    } catch (e) {
      debugPrint("getDogRandomImageBySubBreed:: ${e.toString()}");
      rethrow;
    }
  }

  Future<DogImagesLisDto> getDogImageListBySubBreed({
    required String breed,
    required String subBreed,
  }) async {
    try {
      final response = await _apiService.get(
        endPoint: Api.imageListBySubBreed(breed, subBreed),
      );
      if (response.statusCode == 200) {
        final responseData = DogImagesLisDto.fromJson(response.data);
        debugPrint(
            "getDogImageListBySubBreed result:: ${responseData.toString()}");
        return responseData;
      }

      throw '';
    } catch (e) {
      debugPrint("getDogImageListBySubBreed:: ${e.toString()}");
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
