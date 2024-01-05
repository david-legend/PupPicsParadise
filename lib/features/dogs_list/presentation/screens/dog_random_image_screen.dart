import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_images/features/dogs_list/application/dog_random_image_controller.dart';
import 'package:dog_images/features/dogs_list/domain/entities/dog_images_entities.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class DogRandomImageScreen extends ConsumerStatefulWidget {
  const DogRandomImageScreen({
    super.key,
    required this.dogType,
  });

  final DogType dogType;

  /// Named route for [DogRandomImageScreen]
  static const String routePath = '/dogRandomImage';

  /// Named route for the [DogRandomImageScreen]
  static const routeName = 'dog-random-image-view';

  @override
  ConsumerState<DogRandomImageScreen> createState() =>
      _DogRandomImageScreenState();
}

class _DogRandomImageScreenState extends ConsumerState<DogRandomImageScreen> {
  late AsyncValue<RandomDogImage> randomImageResult;

  @override
  void initState() {
    final data = widget.dogType;
    Future.microtask(() {
      if (data.subBreed == null) {
        ref
            .read(dogRandomImageControllerProvider.notifier)
            .getDogRandomImageByBreed(data.breed);
      } else {
        ref
            .read(dogRandomImageControllerProvider.notifier)
            .getDogRandomImageBySubBreed(
              breed: data.breed,
              subBreed: data.subBreed!,
            );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final randomImageResult = ref.watch(
      dogRandomImageControllerProvider,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Random"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: randomImageResult.when(
        data: (data) {
          if (data.image != null && data.image!.isNotEmpty) {
            return Column(
              children: [
                CachedNetworkImage(
                  imageUrl: data.image!,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(
                          dogRandomImageControllerProvider.notifier,
                        )
                        .getDogRandomImageByBreed(
                          widget.dogType.breed,
                        );
                  },
                  child: Text("reset"),
                ),
              ],
            );
          }
          return Text("Show broken image here");
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
