// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_images_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DogImagesLisDtoImpl _$$DogImagesLisDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DogImagesLisDtoImpl(
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$DogImagesLisDtoImplToJson(
        _$DogImagesLisDtoImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
