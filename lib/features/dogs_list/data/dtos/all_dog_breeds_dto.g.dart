// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_dog_breeds_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllDogBreedsDtoImpl _$$AllDogBreedsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AllDogBreedsDtoImpl(
      message: (json['message'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$AllDogBreedsDtoImplToJson(
        _$AllDogBreedsDtoImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
