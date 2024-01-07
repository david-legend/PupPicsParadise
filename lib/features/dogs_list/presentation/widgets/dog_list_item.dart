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
    this.isSubBreed = false,
  });

  final String title;
  final String imgSrc;
  final double? height;
  final TextStyle? titleStyle;
  final VoidCallback? onRandomImagePress;
  final VoidCallback? onImageListPress;
  final bool isSubBreed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Image.asset(imgSrc, width: 30, height: 30),
          SizedBox(width: Insets.xs),
          Text(
            StringHelper.capitalizeFirstLetter(title),
            style: titleStyle,
          ),
          const Spacer(),
          DogListItemActions(
            isSubBreed: isSubBreed,
            onImageListPress: onImageListPress,
            onRandomImagePress: onRandomImagePress,
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
    this.isSubBreed = false,
  });

  final VoidCallback? onRandomImagePress;
  final VoidCallback? onImageListPress;
  final bool isSubBreed;

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
            icon: const Icon(Icons.photo),
          ),
        ),
        SizedBox(width: Insets.sm),
        SizedBox(
          width: 30,
          height: 30,
          child: IconButton(
            onPressed: onImageListPress,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.photo_library_outlined),
          ),
        ),
      ],
    );
  }
}
