import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/utils/string_helper.dart';
import 'package:flutter/material.dart';

/// [DogListItem] renders row item for each dog breed or sub breed
class DogListItem extends StatelessWidget {
  const DogListItem({
    super.key,
    required this.title,
    this.imgSrc = Images.icDog,
    this.titleStyle,
    this.height,
    this.onRandomImagePress,
    this.onImageListPress,
    this.actionPadding = EdgeInsets.zero,
    this.imageWidth = 40,
    this.imageHeight = 40,
  });

  /// handles title of the row (eg. dog breed)
  final String title;
  /// handles leading icon image of row
  final String imgSrc;
  /// height of row item
  final double? height;
  /// handles styling of [title]
  final TextStyle? titleStyle;
  /// handles callback for what to happen when random Image action icon is pressed
  final VoidCallback? onRandomImagePress;
  /// handles callback for what to happen when Image list action icon is pressed
  final VoidCallback? onImageListPress;
  final EdgeInsetsGeometry actionPadding;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height,
      child: Row(
        children: [
          Image.asset(imgSrc, width: imageWidth, height: imageHeight),
          SizedBox(width: Insets.xs),
          Text(
            StringHelper.capitalizeFirstLetter(title),
            style: titleStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18),
          ),
          const Spacer(),
          Padding(
            padding: actionPadding,
            child: DogListItemActions(
              onImageListPress: onImageListPress,
              onRandomImagePress: onRandomImagePress,
            ),
          ),
        ],
      ),
    );
  }
}

const buttonSize = 30.0;

/// [DogListItemActions] renders action buttons that are used to view dog images
class DogListItemActions extends StatelessWidget {
  const DogListItemActions({
    super.key,
    this.onImageListPress,
    this.onRandomImagePress,
  });

  /// handles callback for what to happen when random Image action icon is pressed
  final VoidCallback? onRandomImagePress;
  /// handles callback for what to happen when Image list action icon is pressed
  final VoidCallback? onImageListPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: IconButton(
            onPressed: onRandomImagePress,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.photo_outlined),
          ),
        ),
        SizedBox(width: Insets.sm),
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: IconButton(
            onPressed: onImageListPress,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.camera),
          ),
        ),
      ],
    );
  }
}
