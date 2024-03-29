import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/common/domain/failures/failure.dart';
import 'package:dog_images/features/dogs_list/application/dog_image_list_controller.dart';
import 'package:dog_images/features/dogs_list/domain/entities/dog_images_entities.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/dog_image_description.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// [DogImageListScreen] renders dogs breeds and subBreeds imageList which is fetched from API
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
    /// makes initial call to fetch imageList based on parameter passed in
    Future.microtask(() {
      fetchDogImageList();
    });
    super.initState();
  }

  void onError() {
    ref.listen<AsyncValue<void>>(
      dogImageListControllerProvider,
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
    imageListResult = ref.watch(dogImageListControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: DogImageDescription(dogType: widget.dogType),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: imageListResult.when(
        data: (data) {
          return Padding(
            padding: EdgeInsets.all(Insets.xs),
            child: MasonryGridView.count(
              crossAxisCount: 3,
              itemCount: data.images.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: Corners.smBorder,
                  child: CachedNetworkImage(
                    imageUrl: data.images[index],
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return Image.asset(
                        Images.imagePlaceholder,
                        fit: BoxFit.cover,
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
              mainAxisSpacing: Insets.xs,
              crossAxisSpacing: Insets.xs,
            ),
          );
        },
        error: (error, stackTrace) {
          //TODO:: parse and present error in a proper way
          return Center(
            child: ErrorHandler(
              message: error.toString(),
              handler: () {
                fetchDogImageList();
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

  /// sends an event which triggers a call to fetch either imageList for dog breed or subBreed
  void fetchDogImageList() {
    final data = widget.dogType;
    if (data.subBreed == null) {
      /// makes call to fetch Dog Image List By Breed
      ref
          .read(dogImageListControllerProvider.notifier)
          .getDogImageListByBreed(data.breed);
    } else {
      /// makes call to fetch Dog Image List By SubBreed
      ref
          .read(dogImageListControllerProvider.notifier)
          .getDogImageListBySubBreed(
            breed: data.breed,
            subBreed: data.subBreed!,
          );
    }
  }
}
