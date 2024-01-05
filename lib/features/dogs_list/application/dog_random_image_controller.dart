import 'package:dog_images/features/dogs_list/data/repositories/dog_images_repository.dart';
import 'package:dog_images/features/dogs_list/domain/entities/dog_images_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_random_image_controller.g.dart';

@riverpod
class DogRandomImageController extends _$DogRandomImageController {
  @override
  FutureOr<RandomDogImage> build(
  //     {
  //   required String breed,
  //   String? subBreed,
  // }
  ) async {
    state = const AsyncData(RandomDogImage());
    // if (subBreed == null) {
    //   await getDogRandomImageByBreed(breed);
    // } else {
    //   await getDogRandomImageBySubBreed(breed: breed, subBreed: subBreed);
    // }
    return state.value ?? const RandomDogImage();
  }

  Future<void> getDogRandomImageByBreed(String breed) async {
    state = const AsyncLoading();

    final dogImagesRepository = ref.read(dogImagesRepositoryProvider);

    final result = await dogImagesRepository.getDogRandomImageByBreed(breed);

    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }

  Future<void> getDogRandomImageBySubBreed({
    required String breed,
    required String subBreed,
  }) async {
    state = const AsyncLoading();

    final dogImagesRepository = ref.read(dogImagesRepositoryProvider);

    final result = await dogImagesRepository.getDogRandomImageBySubBreed(
      breed: breed,
      subBreed: subBreed,
    );

    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}
