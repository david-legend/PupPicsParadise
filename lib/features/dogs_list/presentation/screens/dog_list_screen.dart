import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_image_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_random_image_screen.dart';
import 'package:dog_images/features/dogs_list/application/dog_list_controller.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/dog_list_item.dart';
import 'package:dog_images/l10n/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.dogListTitle),
      ),
      body: allDogBreedsResult.when(
        data: (allDogBreeds) {
          return ListView.separated(
            itemCount: allDogBreeds.data.length,
            itemBuilder: (context, index) {
              final dogBreed = allDogBreeds.data.keys.elementAt(index);
              final subBreeds = allDogBreeds.data[dogBreed] ?? [];

              return Card(
                child: ExpansionTile(
                    title: DogListItem(
                      title: dogBreed,
                      onRandomImagePress: () {
                        Navigator.pushNamed(
                            context, DogRandomImageScreen.routePath);
                      },
                      onImageListPress: () {
                        Navigator.pushNamed(
                            context, DogImageListScreen.routePath);
                      },
                    ),
                    children: subBreeds
                        .map((subBreed) => DogListItem(
                              title: subBreed,
                              onRandomImagePress: () {
                                Navigator.pushNamed(
                                    context, DogRandomImageScreen.routePath);
                              },
                              onImageListPress: () {
                                Navigator.pushNamed(
                                    context, DogImageListScreen.routePath);
                              },
                            ))
                        .toList()),
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
