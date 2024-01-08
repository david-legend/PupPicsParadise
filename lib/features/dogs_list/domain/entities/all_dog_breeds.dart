import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_dog_breeds.freezed.dart';


@freezed
class AllDogBreeds with _$AllDogBreeds {
  const factory AllDogBreeds({
    @Default({}) Map<String, List<String>> breeds,
  }) = _AllDogBreeds;
}
