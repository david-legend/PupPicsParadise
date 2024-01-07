import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:dog_images/utils/string_helper.dart';
import 'package:flutter/material.dart';



class DogImageDescription extends StatelessWidget {
  const DogImageDescription({
    super.key,
    required this.dogType,
  });

  final DogType dogType;

  @override
  Widget build(BuildContext context) {
    if (dogType.subBreed == null) {
      return Text(
        StringHelper.capitalizeFirstLetter(dogType.breed),
        style: AppTextStyles.h7(context),
      );
    } else {
      return Text(
        "${StringHelper.capitalizeFirstLetter(dogType.breed!)}, ${StringHelper.capitalizeFirstLetter(dogType.subBreed!)}",
        style: AppTextStyles.h7(context),
      );
    }
  }
}