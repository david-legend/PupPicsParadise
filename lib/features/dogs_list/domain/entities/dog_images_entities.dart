import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_images_entities.freezed.dart';

@freezed
class DogImages with _$DogImages {
  const factory DogImages({
    @Default([])  List<String> images ,
  }) = _DogImages;

}


@freezed
class RandomDogImage with _$RandomDogImage {
  const factory RandomDogImage({
     String? image ,
  }) = _RandomDogImage;

}