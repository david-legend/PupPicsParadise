import 'dart:async';

import 'package:dog_images/features/common/domain/failures/failure.dart';
import 'package:dog_images/features/common/domain/network/error_handler.dart';
import 'package:dog_images/features/common/domain/network/network_info.dart';
import 'package:dog_images/features/dogs_list/data/data_sources/dog_images_remote_data_source.dart';
import 'package:dog_images/features/dogs_list/domain/entities/all_dog_breeds.dart';
import 'package:dog_images/features/dogs_list/domain/entities/dog_images_entities.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_images_repository.g.dart';

/// Repository for connecting to data sources
class DogImagesRepository {
  /// checks for network connection
  final NetworkInfo _networkInfo;
  /// connects repository to remote data source
  final DogImagesRemoteDataSource _dogImagesRemoteDataSource;

  DogImagesRepository(
    this._networkInfo,
    this._dogImagesRemoteDataSource,
  );

  /// gets all Dog Breeds
  Future<Either<Failure, AllDogBreeds>> getAllDogBreeds() async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _dogImagesRemoteDataSource.getAllDogBreeds();

        return Right(AllDogBreeds(breeds: result.message));
      } catch (error) {
        debugPrint(
            "DogImagesRepository:: getAllDogBreeds:: ${error.toString()}");
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  /// gets Random Image of Dog By Breed
  Future<Either<Failure, RandomDogImage>> getDogRandomImageByBreed(
    String breed,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final result =
            await _dogImagesRemoteDataSource.getDogRandomImageByBreed(breed);

        return Right(RandomDogImage(image: result.message));
      } catch (error) {
        debugPrint(
          "DogImagesRepository:: getDogRandomImageByBreed:: ${error.toString()}",
        );
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  /// gets Random Image of Dog By Breed and SubBreed
  Future<Either<Failure, RandomDogImage>> getDogRandomImageBySubBreed({
    required String breed,
    required String subBreed,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final result =
            await _dogImagesRemoteDataSource.getDogRandomImageBySubBreed(
          breed: breed,
          subBreed: subBreed,
        );

        return Right(RandomDogImage(image: result.message));
      } catch (error) {
        debugPrint(
          "DogImagesRepository:: getDogRandomImageBySubBreed:: ${error.toString()}",
        );
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }


  /// gets Image list of Dogs By Breed
  Future<Either<Failure, DogImages>> getDogImageListByBreed(
    String breed,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final result =
            await _dogImagesRemoteDataSource.getDogImageListByBreed(breed);

        return Right(DogImages(images: result.message));
      } catch (error) {
        debugPrint(
          "DogImagesRepository:: getDogImageListByBreed:: ${error.toString()}",
        );
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  /// gets Image list of Dogs By Breed and SubBreed
  Future<Either<Failure, DogImages>> getDogImageListBySubBreed({
    required String breed,
    required String subBreed,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final result =
            await _dogImagesRemoteDataSource.getDogImageListBySubBreed(
          breed: breed,
          subBreed: subBreed,
        );

        return Right(DogImages(images: result.message));
      } catch (error) {
        debugPrint(
          "DogImagesRepository:: getDogImageListBySubBreed:: ${error.toString()}",
        );
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}

@Riverpod(keepAlive: true)
DogImagesRepository dogImagesRepository(DogImagesRepositoryRef ref) {
  final networkInfo = ref.watch(networkInfoProvider);
  final dogImagesRemote = ref.watch(dogImagesRemoteDataSourceProvider);
  return DogImagesRepository(networkInfo, dogImagesRemote);
}
