import 'dart:async';

import 'package:dog_images/features/common/domain/failures/failure.dart';
import 'package:dog_images/features/common/domain/network/error_handler.dart';
import 'package:dog_images/features/common/domain/network/network_info.dart';
import 'package:dog_images/features/dogs_list/data/data_sources/dog_images_remote_data_source.dart';
import 'package:dog_images/features/dogs_list/domain/entities/all_dog_breeds.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_images_repository.g.dart';

class DogImagesRepository {
  final NetworkInfo _networkInfo;
  final DogImagesRemoteDataSource _dogImagesRemoteDataSource;

  DogImagesRepository(
    this._networkInfo,
    this._dogImagesRemoteDataSource,
  );

  Future<Either<Failure, AllDogBreeds>> getAllDogBreeds() async {
    if (await _networkInfo.isConnected) {
      try {
        final authState = await _dogImagesRemoteDataSource.getAllDogBreeds();

        return Right(AllDogBreeds(data: authState.message));
      } catch (error) {
        debugPrint("resetPassword AuthRepository:: ${error.toString()}");
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
