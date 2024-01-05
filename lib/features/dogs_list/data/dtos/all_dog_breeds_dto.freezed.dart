// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_dog_breeds_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllDogBreedsDto _$AllDogBreedsDtoFromJson(Map<String, dynamic> json) {
  return _AllDogBreedsDto.fromJson(json);
}

/// @nodoc
mixin _$AllDogBreedsDto {
  Map<String, List<String>> get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllDogBreedsDtoCopyWith<AllDogBreedsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllDogBreedsDtoCopyWith<$Res> {
  factory $AllDogBreedsDtoCopyWith(
          AllDogBreedsDto value, $Res Function(AllDogBreedsDto) then) =
      _$AllDogBreedsDtoCopyWithImpl<$Res, AllDogBreedsDto>;
  @useResult
  $Res call({Map<String, List<String>> message, String status});
}

/// @nodoc
class _$AllDogBreedsDtoCopyWithImpl<$Res, $Val extends AllDogBreedsDto>
    implements $AllDogBreedsDtoCopyWith<$Res> {
  _$AllDogBreedsDtoCopyWithImpl(this._value, this._then);

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
              as Map<String, List<String>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllDogBreedsDtoImplCopyWith<$Res>
    implements $AllDogBreedsDtoCopyWith<$Res> {
  factory _$$AllDogBreedsDtoImplCopyWith(_$AllDogBreedsDtoImpl value,
          $Res Function(_$AllDogBreedsDtoImpl) then) =
      __$$AllDogBreedsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<String>> message, String status});
}

/// @nodoc
class __$$AllDogBreedsDtoImplCopyWithImpl<$Res>
    extends _$AllDogBreedsDtoCopyWithImpl<$Res, _$AllDogBreedsDtoImpl>
    implements _$$AllDogBreedsDtoImplCopyWith<$Res> {
  __$$AllDogBreedsDtoImplCopyWithImpl(
      _$AllDogBreedsDtoImpl _value, $Res Function(_$AllDogBreedsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$AllDogBreedsDtoImpl(
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllDogBreedsDtoImpl implements _AllDogBreedsDto {
  const _$AllDogBreedsDtoImpl(
      {required final Map<String, List<String>> message, required this.status})
      : _message = message;

  factory _$AllDogBreedsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllDogBreedsDtoImplFromJson(json);

  final Map<String, List<String>> _message;
  @override
  Map<String, List<String>> get message {
    if (_message is EqualUnmodifiableMapView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_message);
  }

  @override
  final String status;

  @override
  String toString() {
    return 'AllDogBreedsDto(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllDogBreedsDtoImpl &&
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
  _$$AllDogBreedsDtoImplCopyWith<_$AllDogBreedsDtoImpl> get copyWith =>
      __$$AllDogBreedsDtoImplCopyWithImpl<_$AllDogBreedsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllDogBreedsDtoImplToJson(
      this,
    );
  }
}

abstract class _AllDogBreedsDto implements AllDogBreedsDto {
  const factory _AllDogBreedsDto(
      {required final Map<String, List<String>> message,
      required final String status}) = _$AllDogBreedsDtoImpl;

  factory _AllDogBreedsDto.fromJson(Map<String, dynamic> json) =
      _$AllDogBreedsDtoImpl.fromJson;

  @override
  Map<String, List<String>> get message;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$AllDogBreedsDtoImplCopyWith<_$AllDogBreedsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
