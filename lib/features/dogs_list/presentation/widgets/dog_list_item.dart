import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/utils/string_helper.dart';
import 'package:flutter/material.dart';

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

  final String title;
  final String imgSrc;
  final double? height;
  final TextStyle? titleStyle;
  final VoidCallback? onRandomImagePress;
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

class DogListItemActions extends StatelessWidget {
  const DogListItemActions({
    super.key,
    this.onImageListPress,
    this.onRandomImagePress,
  });

  final VoidCallback? onRandomImagePress;
  final VoidCallback? onImageListPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: IconButton(
            onPressed: onRandomImagePress,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.photo_outlined),
          ),
        ),
        SizedBox(width: Insets.sm),
        SizedBox(
          width: 30,
          height: 30,
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
