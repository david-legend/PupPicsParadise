import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:dog_images/utils/string_helper.dart';
import 'package:flutter/material.dart';

/// [DogImageDescription] used to describe the name of the dog whose image is being shown
class DogImageDescription extends StatelessWidget {
  const DogImageDescription({
    super.key,
    required this.dogType,
  });

  final DogType dogType;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        );
    if (dogType.subBreed == null) {
      return Text(
        StringHelper.capitalizeFirstLetter(dogType.breed),
        style: textStyle,
      );
    } else {
      return Text(
        "${StringHelper.capitalizeFirstLetter(dogType.breed!)}, ${StringHelper.capitalizeFirstLetter(dogType.subBreed!)}",
        style: textStyle,
      );
    }
  }
}
