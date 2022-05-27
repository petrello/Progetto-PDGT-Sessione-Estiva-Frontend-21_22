// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'asset_icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssetIconDTO _$AssetIconDTOFromJson(Map<String, dynamic> json) {
  return _AssetIconDTO.fromJson(json);
}

/// @nodoc
mixin _$AssetIconDTO {
  String get assetId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetIconDTOCopyWith<AssetIconDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetIconDTOCopyWith<$Res> {
  factory $AssetIconDTOCopyWith(
          AssetIconDTO value, $Res Function(AssetIconDTO) then) =
      _$AssetIconDTOCopyWithImpl<$Res>;
  $Res call({String assetId, String url});
}

/// @nodoc
class _$AssetIconDTOCopyWithImpl<$Res> implements $AssetIconDTOCopyWith<$Res> {
  _$AssetIconDTOCopyWithImpl(this._value, this._then);

  final AssetIconDTO _value;
  // ignore: unused_field
  final $Res Function(AssetIconDTO) _then;

  @override
  $Res call({
    Object? assetId = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      assetId: assetId == freezed
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AssetIconDTOCopyWith<$Res>
    implements $AssetIconDTOCopyWith<$Res> {
  factory _$$_AssetIconDTOCopyWith(
          _$_AssetIconDTO value, $Res Function(_$_AssetIconDTO) then) =
      __$$_AssetIconDTOCopyWithImpl<$Res>;
  @override
  $Res call({String assetId, String url});
}

/// @nodoc
class __$$_AssetIconDTOCopyWithImpl<$Res>
    extends _$AssetIconDTOCopyWithImpl<$Res>
    implements _$$_AssetIconDTOCopyWith<$Res> {
  __$$_AssetIconDTOCopyWithImpl(
      _$_AssetIconDTO _value, $Res Function(_$_AssetIconDTO) _then)
      : super(_value, (v) => _then(v as _$_AssetIconDTO));

  @override
  _$_AssetIconDTO get _value => super._value as _$_AssetIconDTO;

  @override
  $Res call({
    Object? assetId = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_AssetIconDTO(
      assetId: assetId == freezed
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssetIconDTO implements _AssetIconDTO {
  const _$_AssetIconDTO({required this.assetId, required this.url});

  factory _$_AssetIconDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AssetIconDTOFromJson(json);

  @override
  final String assetId;
  @override
  final String url;

  @override
  String toString() {
    return 'AssetIconDTO(assetId: $assetId, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetIconDTO &&
            const DeepCollectionEquality().equals(other.assetId, assetId) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(assetId),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_AssetIconDTOCopyWith<_$_AssetIconDTO> get copyWith =>
      __$$_AssetIconDTOCopyWithImpl<_$_AssetIconDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetIconDTOToJson(this);
  }
}

abstract class _AssetIconDTO implements AssetIconDTO {
  const factory _AssetIconDTO(
      {required final String assetId,
      required final String url}) = _$_AssetIconDTO;

  factory _AssetIconDTO.fromJson(Map<String, dynamic> json) =
      _$_AssetIconDTO.fromJson;

  @override
  String get assetId => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AssetIconDTOCopyWith<_$_AssetIconDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
