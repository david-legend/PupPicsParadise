import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_dog_breeds_dto.freezed.dart';
part 'all_dog_breeds_dto.g.dart';

@freezed
class AllDogBreedsDto with _$AllDogBreedsDto {
  const factory AllDogBreedsDto({
    required Map<String, List<String>> message,
    required String status,
  }) = _AllDogBreedsDto;

  factory AllDogBreedsDto.fromJson(Map<String, dynamic> json) =>
      _$AllDogBreedsDtoFromJson(json);
}