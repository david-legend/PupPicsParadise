import 'package:dog_images/features/dogs_list/data/repositories/dog_images_repository.dart';
import 'package:dog_images/features/dogs_list/domain/entities/all_dog_breeds.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_list_controller.g.dart';

/// controller for handling network calls to fetch all dog breeds and subBreeds
@Riverpod(keepAlive: true)
class DogListController extends _$DogListController {
  @override
  FutureOr<AllDogBreeds> build() async {
    return const AllDogBreeds();
  }

  /// makes call through the repository to fetch all dog breeds
  Future<void> getAllDogBreeds() async {
    state = const AsyncLoading();

    final dogImagesRepository = ref.read(dogImagesRepositoryProvider);

    final result = await dogImagesRepository.getAllDogBreeds();

    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}
