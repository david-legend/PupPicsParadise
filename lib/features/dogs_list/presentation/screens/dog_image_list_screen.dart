import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/dogs_list/application/dog_image_list_controller.dart';
import 'package:dog_images/features/dogs_list/domain/entities/dog_images_entities.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/dog_image_description.dart';
import 'package:dog_images/features/dogs_list/presentation/widgets/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    Future.microtask(() {
      fetchDogImageList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageListResult = ref.watch(dogImageListControllerProvider);
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
          if (data.images.isNotEmpty) {
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
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
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
          }
          return const Text("No Images for this breed");
        },
        error: (error, stackTrace) {
          //TODO:: parse and present error in a proper way
          return ErrorHandler(
            message: error.toString(),
            handler: () {
              fetchDogImageList();
            },
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

  void fetchDogImageList() {
    final data = widget.dogType;
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
  }
}
