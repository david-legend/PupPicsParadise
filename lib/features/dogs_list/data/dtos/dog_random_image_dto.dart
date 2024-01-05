import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_random_image_dto.freezed.dart';
part 'dog_random_image_dto.g.dart';

@freezed
class DogRandomImageDto with _$DogRandomImageDto {
  const factory DogRandomImageDto({
    required String message,
    required String status,
  }) = _DogRandomImageDto;

  factory DogRandomImageDto.fromJson(Map<String, dynamic> json) =>
      _$DogRandomImageDtoFromJson(json);
}