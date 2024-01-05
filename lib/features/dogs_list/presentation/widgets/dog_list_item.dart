import 'package:dog_images/config/values/values.dart';
import 'package:flutter/material.dart';

class DogListItem extends StatelessWidget {
  const DogListItem({
    super.key,
    required this.title,
    this.titleStyle,
    this.onRandomImagePress,
    this.onImageListPress,
  });

  final String title;
  final TextStyle? titleStyle;
  final VoidCallback? onRandomImagePress;
  final VoidCallback? onImageListPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        DogListItemActions(
          onImageListPress: onImageListPress,
          onRandomImagePress: onRandomImagePress,
        ),
      ],
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
        IconButton(
          onPressed: onRandomImagePress,
          icon: const Icon(Icons.add),
        ),
        SizedBox(width: Insets.xs),
        IconButton(
          onPressed: onImageListPress,
          icon: const Icon(Icons.ac_unit_rounded),
        ),
      ],
    );
  }
}
