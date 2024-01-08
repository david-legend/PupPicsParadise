import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/common/domain/failures/failure.dart';
import 'package:dog_images/features/dogs_list/application/dog_random_image_controller.dart';
import 'package:dog_images/features/dogs_list/domain/entities/dog_images_entities.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/dog_image_description.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const progressIndicatorSize = 40.0;

/// [DogRandomImageScreen] renders random images of dogs breeds and subBreeds which is fetched from API
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
    /// makes initial call to fetch random image based on parameter passed in
    Future.microtask(() {
      fetchRandomImageOfDog();
    });
    super.initState();
  }

  void onError() {
    ref.listen<AsyncValue<void>>(
      dogRandomImageControllerProvider,
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
    randomImageResult = ref.watch(
      dogRandomImageControllerProvider,
    );
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: DogImageDescription(dogType: widget.dogType),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: randomImageResult.when(
        data: (data) {
          if (data.image != null && data.image!.isNotEmpty) {
            return Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: data.image!,
                  width: screenWidth,
                  height: screenHeight,
                  fit: BoxFit.fitHeight,
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return Center(
                      child: SizedBox(
                        width: progressIndicatorSize,
                        height: progressIndicatorSize,
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ],
            );
          }
          return Image.asset(
            Images.imagePlaceholder,
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight,
          );
        },
        error: (error, stackTrace) {
          //TODO:: parse and present error in a proper way
          return ErrorHandler(
            message: error.toString(),
            handler: () {
              fetchRandomImageOfDog();
            },
          );
        },
        loading: () {
          return const Center(
            child: SizedBox(
              width: progressIndicatorSize,
              height: progressIndicatorSize,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(dogRandomImageControllerProvider.notifier)
              .getDogRandomImageByBreed(widget.dogType.breed);
        },
        child: const Icon(Icons.shuffle_outlined),
      ),
    );
  }

  /// sends an event which triggers a call to fetch a random image for dog breed or subBreed
  fetchRandomImageOfDog() {
    final data = widget.dogType;
    if (data.subBreed == null) {
      /// makes call to fetch random dog Image By Breed
      ref
          .read(dogRandomImageControllerProvider.notifier)
          .getDogRandomImageByBreed(data.breed);
    } else {
      /// makes call to fetch random dog Image By SubBreed
      ref
          .read(dogRandomImageControllerProvider.notifier)
          .getDogRandomImageBySubBreed(
            breed: data.breed,
            subBreed: data.subBreed!,
          );
    }
  }
}
