// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dog_random_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DogRandomImageDto _$DogRandomImageDtoFromJson(Map<String, dynamic> json) {
  return _DogRandomImageDto.fromJson(json);
}

/// @nodoc
mixin _$DogRandomImageDto {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DogRandomImageDtoCopyWith<DogRandomImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogRandomImageDtoCopyWith<$Res> {
  factory $DogRandomImageDtoCopyWith(
          DogRandomImageDto value, $Res Function(DogRandomImageDto) then) =
      _$DogRandomImageDtoCopyWithImpl<$Res, DogRandomImageDto>;
  @useResult
  $Res call({String message, String status});
}

/// @nodoc
class _$DogRandomImageDtoCopyWithImpl<$Res, $Val extends DogRandomImageDto>
    implements $DogRandomImageDtoCopyWith<$Res> {
  _$DogRandomImageDtoCopyWithImpl(this._value, this._then);

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
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DogRandomImageDtoImplCopyWith<$Res>
    implements $DogRandomImageDtoCopyWith<$Res> {
  factory _$$DogRandomImageDtoImplCopyWith(_$DogRandomImageDtoImpl value,
          $Res Function(_$DogRandomImageDtoImpl) then) =
      __$$DogRandomImageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String status});
}

/// @nodoc
class __$$DogRandomImageDtoImplCopyWithImpl<$Res>
    extends _$DogRandomImageDtoCopyWithImpl<$Res, _$DogRandomImageDtoImpl>
    implements _$$DogRandomImageDtoImplCopyWith<$Res> {
  __$$DogRandomImageDtoImplCopyWithImpl(_$DogRandomImageDtoImpl _value,
      $Res Function(_$DogRandomImageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$DogRandomImageDtoImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DogRandomImageDtoImpl implements _DogRandomImageDto {
  const _$DogRandomImageDtoImpl({required this.message, required this.status});

  factory _$DogRandomImageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DogRandomImageDtoImplFromJson(json);

  @override
  final String message;
  @override
  final String status;

  @override
  String toString() {
    return 'DogRandomImageDto(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DogRandomImageDtoImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DogRandomImageDtoImplCopyWith<_$DogRandomImageDtoImpl> get copyWith =>
      __$$DogRandomImageDtoImplCopyWithImpl<_$DogRandomImageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DogRandomImageDtoImplToJson(
      this,
    );
  }
}

abstract class _DogRandomImageDto implements DogRandomImageDto {
  const factory _DogRandomImageDto(
      {required final String message,
      required final String status}) = _$DogRandomImageDtoImpl;

  factory _DogRandomImageDto.fromJson(Map<String, dynamic> json) =
      _$DogRandomImageDtoImpl.fromJson;

  @override
  String get message;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$DogRandomImageDtoImplCopyWith<_$DogRandomImageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
