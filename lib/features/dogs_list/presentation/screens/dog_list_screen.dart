import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/common/domain/failures/failure.dart';
import 'package:dog_images/features/dogs_list/domain/entities/all_dog_breeds.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_image_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_random_image_screen.dart';
import 'package:dog_images/features/dogs_list/application/dog_list_controller.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/dog_list_item.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/error_handler.dart';
import 'package:dog_images/l10n/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [DogType] used as an argument passed to other screens to determine which network call to work
class DogType {
  final String breed;
  final String? subBreed;

  DogType({
    required this.breed,
    this.subBreed,
  });
}

/// [DogListScreen] renders dogs breeds and subBreeds list which is fetched from API
class DogListScreen extends ConsumerStatefulWidget {
  const DogListScreen({super.key});

  /// Named route for [DogListScreen]
  static const String routePath = '/dogList';

  /// Named route for the [DogListScreen]
  static const routeName = 'dog-list-view';

  @override
  ConsumerState<DogListScreen> createState() => _DogListScreenState();
}

class _DogListScreenState extends ConsumerState<DogListScreen> {
  late AsyncValue<AllDogBreeds> allDogBreedsResult;

  @override
  void initState() {
    /// makes initial call to fetch all Dog breeds and subBreeds
    Future.microtask(() {
      fetchAllDogBreeds();
    });
    super.initState();
  }

  void onError() {
    ref.listen<AsyncValue<void>>(
      dogListControllerProvider,
      (_, state) => state.whenOrNull(
        error: (error, s) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text((error as Failure).message)),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    onError();
    const breedPadding =
        EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 10);
    const subBreedPadding =
        EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 50);
    allDogBreedsResult = ref.watch(dogListControllerProvider);

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.icLogo, width: 40, height: 40),
            SizedBox(width: Insets.xs),
            Text(
              context.loc.dogListTitle,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: allDogBreedsResult.when(
        data: (data) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: Insets.paddingSm),
            itemCount: data.breeds.length,
            itemBuilder: (context, index) {
              final dogBreed = data.breeds.keys.elementAt(index);
              final subBreeds = data.breeds[dogBreed] ?? [];
              final dogType = DogType(breed: dogBreed);
              return Card(
                child: ExpansionTile(
                    trailing:
                        subBreeds.isEmpty ? const SizedBox.shrink() : null,
                    tilePadding: breedPadding,
                    collapsedShape: Shapes.shapeBorderSm,
                    shape: Shapes.shapeBorderSm,
                    title: DogListItem(
                      title: dogBreed,
                      onRandomImagePress: () {
                        navigateToRandomImageScreen(dogType);
                      },
                      onImageListPress: () {
                        navigateToImageListScreen(dogType);
                      },
                    ),
                    children: subBreeds.map((subBreed) {
                      final subBreedDogType =
                          DogType(breed: dogBreed, subBreed: subBreed);
                      return Padding(
                        padding: subBreedPadding,
                        child: DogListItem(
                          title: subBreed,
                          imageHeight: 28,
                          imageWidth: 28,
                          titleStyle: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 15),
                          height: 36,
                          imgSrc: Images.icDogPaw,
                          onRandomImagePress: () {
                            navigateToRandomImageScreen(subBreedDogType);
                          },
                          onImageListPress: () {
                            navigateToImageListScreen(subBreedDogType);
                          },
                        ),
                      );
                    }).toList()),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: Insets.sm);
            },
          );
        },
        error: (error, stacktrace) {
          return Center(
            child: ErrorHandler(
              message: (error as Failure).message,
              handler: () {
                fetchAllDogBreeds();
              },
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void navigateToRandomImageScreen(DogType dogType) {
    Navigator.pushNamed(
      context,
      DogRandomImageScreen.routePath,
      arguments: dogType,
    );
  }

  void navigateToImageListScreen(DogType dogType) {
    Navigator.pushNamed(
      context,
      DogImageListScreen.routePath,
      arguments: dogType,
    );
  }

  /// sends an event which triggers a call to fetch all dog breed asn subBreeds
  void fetchAllDogBreeds() {
    ref.read(dogListControllerProvider.notifier).getAllDogBreeds();
  }
}
