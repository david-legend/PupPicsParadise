import 'package:dog_images/features/dogs_list/data/repositories/dog_images_repository.dart';
import 'package:dog_images/features/dogs_list/domain/entities/dog_images_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_image_list_controller.g.dart';

@riverpod
class DogImageListController extends _$DogImageListController {
  @override
  FutureOr<DogImages> build() async {
    state = const AsyncData(DogImages());
    await getDogImageListByBreed("");
    return state.value ?? const DogImages();
  }

  Future<void> getDogImageListByBreed(String breed) async {
    state = const AsyncLoading();

    final dogImagesRepository = ref.read(dogImagesRepositoryProvider);

    final result = await dogImagesRepository.getDogImageListByBreed(breed);

    state = await result.fold(
          (l) => AsyncError(l, StackTrace.current),
          (r) => AsyncData(r),
    );
  }

  Future<void> getDogImageListBySubBreed({
    required String breed,
    required String subBreed,
  }) async {
    state = const AsyncLoading();

    final dogImagesRepository = ref.read(dogImagesRepositoryProvider);

    final result = await dogImagesRepository.getDogImageListBySubBreed(
      breed: breed,
      subBreed: subBreed,
    );

    state = await result.fold(
          (l) => AsyncError(l, StackTrace.current),
          (r) => AsyncData(r),
    );
  }
}