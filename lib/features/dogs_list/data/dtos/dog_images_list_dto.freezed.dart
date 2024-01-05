// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dog_images_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DogImagesLisDto _$DogImagesLisDtoFromJson(Map<String, dynamic> json) {
  return _DogImagesLisDto.fromJson(json);
}

/// @nodoc
mixin _$DogImagesLisDto {
  List<String> get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DogImagesLisDtoCopyWith<DogImagesLisDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogImagesLisDtoCopyWith<$Res> {
  factory $DogImagesLisDtoCopyWith(
          DogImagesLisDto value, $Res Function(DogImagesLisDto) then) =
      _$DogImagesLisDtoCopyWithImpl<$Res, DogImagesLisDto>;
  @useResult
  $Res call({List<String> message, String status});
}

/// @nodoc
class _$DogImagesLisDtoCopyWithImpl<$Res, $Val extends DogImagesLisDto>
    implements $DogImagesLisDtoCopyWith<$Res> {
  _$DogImagesLisDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DogImagesLisDtoImplCopyWith<$Res>
    implements $DogImagesLisDtoCopyWith<$Res> {
  factory _$$DogImagesLisDtoImplCopyWith(_$DogImagesLisDtoImpl value,
          $Res Function(_$DogImagesLisDtoImpl) then) =
      __$$DogImagesLisDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> message, String status});
}

/// @nodoc
class __$$DogImagesLisDtoImplCopyWithImpl<$Res>
    extends _$DogImagesLisDtoCopyWithImpl<$Res, _$DogImagesLisDtoImpl>
    implements _$$DogImagesLisDtoImplCopyWith<$Res> {
  __$$DogImagesLisDtoImplCopyWithImpl(
      _$DogImagesLisDtoImpl _value, $Res Function(_$DogImagesLisDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$DogImagesLisDtoImpl(
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DogImagesLisDtoImpl implements _DogImagesLisDto {
  const _$DogImagesLisDtoImpl(
      {required final List<String> message, required this.status})
      : _message = message;

  factory _$DogImagesLisDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DogImagesLisDtoImplFromJson(json);

  final List<String> _message;
  @override
  List<String> get message {
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  final String status;

  @override
  String toString() {
    return 'DogImagesLisDto(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DogImagesLisDtoImpl &&
            const DeepCollectionEquality().equals(other._message, _message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_message), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DogImagesLisDtoImplCopyWith<_$DogImagesLisDtoImpl> get copyWith =>
      __$$DogImagesLisDtoImplCopyWithImpl<_$DogImagesLisDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DogImagesLisDtoImplToJson(
      this,
    );
  }
}

abstract class _DogImagesLisDto implements DogImagesLisDto {
  const factory _DogImagesLisDto(
      {required final List<String> message,
      required final String status}) = _$DogImagesLisDtoImpl;

  factory _DogImagesLisDto.fromJson(Map<String, dynamic> json) =
      _$DogImagesLisDtoImpl.fromJson;

  @override
  List<String> get message;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$DogImagesLisDtoImplCopyWith<_$DogImagesLisDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
