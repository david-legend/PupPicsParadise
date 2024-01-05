import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_images/features/dogs_list/application/dog_image_list_controller.dart';
import 'package:dog_images/features/dogs_list/domain/entities/dog_images_entities.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogImageListScreen extends ConsumerStatefulWidget {
  const DogImageListScreen({
    super.key,
    required this.dogType,
  });

  final DogType dogType;

  /// Named route for [DogImageListScreen]
  static const String routePath = '/dogImageList';

  /// Named route for the [DogImageListScreen]
  static const routeName = 'dog-image-list-view';

  @override
  ConsumerState<DogImageListScreen> createState() => _DogImageListScreenState();
}

class _DogImageListScreenState extends ConsumerState<DogImageListScreen> {
  late AsyncValue<DogImages> imageListResult;

  @override
  void initState() {
    final data = widget.dogType;
    Future.microtask(() {
      if (data.subBreed == null) {
        ref
            .read(dogImageListControllerProvider.notifier)
            .getDogImageListByBreed(data.breed);
      } else {
        ref
            .read(dogImageListControllerProvider.notifier)
            .getDogImageListBySubBreed(
              breed: data.breed,
              subBreed: data.subBreed!,
            );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageListResult = ref.watch(dogImageListControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image List"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: imageListResult.when(
        data: (data) {
          if (data.images.isNotEmpty) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: data.images.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: data.images[index],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                );
              },
            );
          }
          return const Text("No Images for this breed");
        },
        error: (error, stackTrace) {
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
