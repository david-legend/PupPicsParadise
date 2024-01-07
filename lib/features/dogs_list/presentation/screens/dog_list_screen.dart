import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_image_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_random_image_screen.dart';
import 'package:dog_images/features/dogs_list/application/dog_list_controller.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/dog_list_item.dart';
import 'package:dog_images/l10n/app_localizations_context.dart';
import 'package:dog_images/utils/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    const breedPadding =
        EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 10);
    const subBreedPadding =
        EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 50);
    final allDogBreedsResult = ref.watch(dogListControllerProvider);

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

// class DogType {
//   final String breed;
//   final String? subBreed;
//
//   DogType({
//     required this.breed,
//     this.subBreed,
//   });
// }
//
// class DogListScreen extends ConsumerStatefulWidget {
//   const DogListScreen({super.key});
//
//   /// Named route for [DogListScreen]
//   static const String routePath = '/dogList';
//
//   /// Named route for the [DogListScreen]
//   static const routeName = 'dog-list-view';
//
//   @override
//   ConsumerState<DogListScreen> createState() => _DogListScreenState();
// }
//
// class _DogListScreenState extends ConsumerState<DogListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final allDogBreedsResult = ref.watch(dogListControllerProvider);
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(Images.icLogo, width: 40, height: 40),
//             SizedBox(width: Insets.xs),
//             Text(
//               context.loc.dogListTitle,
//               style: textTheme.titleLarge?.copyWith(
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: allDogBreedsResult.when(
//         data: (data) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: MasonryGridView.count(
//               // physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               crossAxisCount: 2,
//               itemCount: data.breeds.length,
//               mainAxisSpacing: 8,
//               crossAxisSpacing: Insets.xs,
//               itemBuilder: (BuildContext context, int index) {
//                 final dogBreed = data.breeds.keys.elementAt(index);
//                 final subBreeds = data.breeds[dogBreed] ?? [];
//                 final dogType = DogType(breed: dogBreed);
//                 return Card(
//                   child: ExpansionTile(
//                     trailing: subBreeds.isEmpty ? const SizedBox.shrink() : null,
//                     collapsedShape: Shapes.shapeBorderSm,
//                     shape: Shapes.shapeBorderSm,
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Image.asset(
//                         //   Images.icDog,
//                         //   width: 60,
//                         //   height: 60,
//                         // ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 StringHelper.capitalizeFirstLetter(dogBreed),
//                                 style: AppTextStyles.h10(context),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: Insets.sm),
//                         Row(
//                           children: [
//                             const Icon(Icons.photo_outlined),
//                             SizedBox(width: Insets.xs),
//                             Icon(Icons.camera),
//                           ],
//                         )
//                       ],
//                     ),
//                     children: [
//                       ListView(
//                         shrinkWrap: true,
//                         children: subBreeds.map(
//                           (subBreed) {
//                             return Row(
//                               children: [
//                                 Text(subBreed),
//                                 Spacer(),
//                                 Icon(Icons.photo_outlined),
//                                 Icon(Icons.photo_library_outlined),
//                               ],
//                             );
//                           },
//                         ).toList(),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//         error: (error, stacktrace) {
//           return const Center(
//             child: Text("Retry"),
//           );
//         },
//         loading: () {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
