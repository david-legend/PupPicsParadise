import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_images_list_dto.freezed.dart';
part 'dog_images_list_dto.g.dart';

@freezed
class DogImagesLisDto with _$DogImagesLisDto {
  const factory DogImagesLisDto({
    required List<String> message,
    required String status,
  }) = _DogImagesLisDto;

  factory DogImagesLisDto.fromJson(Map<String, dynamic> json) =>
      _$DogImagesLisDtoFromJson(json);
}