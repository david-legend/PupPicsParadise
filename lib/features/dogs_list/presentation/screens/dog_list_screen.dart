import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_image_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_random_image_screen.dart';
import 'package:dog_images/features/dogs_list/application/dog_list_controller.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/dog_list_item.dart';
import 'package:dog_images/l10n/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogType {
  final String breed;
  final String? subBreed;

  DogType({
    required this.breed,
    this.subBreed,
  });
}

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
  @override
  Widget build(BuildContext context) {
    final allDogBreedsResult = ref.watch(dogListControllerProvider);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
                color: const Color(0xFFD9E4F9),
                child: ExpansionTile(
                    trailing:
                        subBreeds.isEmpty ? const SizedBox.shrink() : null,
                    // backgroundColor: AppColors.primaryContainer,
                    collapsedShape: Shapes.shapeBorderSm,
                    shape: Shapes.shapeBorderSm,
                    title: DogListItem(
                      title: dogBreed,
                      onRandomImagePress: () {
                        Navigator.pushNamed(
                          context,
                          DogRandomImageScreen.routePath,
                          arguments: dogType,
                        );
                      },
                      onImageListPress: () {
                        Navigator.pushNamed(
                          context,
                          DogImageListScreen.routePath,
                          arguments: dogType,
                        );
                      },
                    ),
                    children: subBreeds.map((subBreed) {
                      final subBreedDogType =
                          DogType(breed: dogBreed, subBreed: subBreed);
                      return Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: DogListItem(
                          title: subBreed,
                          height: 36,
                          imgSrc: Images.icDogPaw,
                          onRandomImagePress: () {
                            Navigator.pushNamed(
                              context,
                              DogRandomImageScreen.routePath,
                              arguments: subBreedDogType,
                            );
                          },
                          onImageListPress: () {
                            Navigator.pushNamed(
                              context,
                              DogImageListScreen.routePath,
                              arguments: subBreedDogType,
                            );
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
          return const Center(
            child: Text("Retry"),
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
}
