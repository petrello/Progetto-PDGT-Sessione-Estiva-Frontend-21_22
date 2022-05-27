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

/// @nodoc
mixin _$AssetIcon {
  String get assetId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssetIconCopyWith<AssetIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetIconCopyWith<$Res> {
  factory $AssetIconCopyWith(AssetIcon value, $Res Function(AssetIcon) then) =
      _$AssetIconCopyWithImpl<$Res>;
  $Res call({String assetId, String url});
}

/// @nodoc
class _$AssetIconCopyWithImpl<$Res> implements $AssetIconCopyWith<$Res> {
  _$AssetIconCopyWithImpl(this._value, this._then);

  final AssetIcon _value;
  // ignore: unused_field
  final $Res Function(AssetIcon) _then;

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
abstract class _$$_AssetIconCopyWith<$Res> implements $AssetIconCopyWith<$Res> {
  factory _$$_AssetIconCopyWith(
          _$_AssetIcon value, $Res Function(_$_AssetIcon) then) =
      __$$_AssetIconCopyWithImpl<$Res>;
  @override
  $Res call({String assetId, String url});
}

/// @nodoc
class __$$_AssetIconCopyWithImpl<$Res> extends _$AssetIconCopyWithImpl<$Res>
    implements _$$_AssetIconCopyWith<$Res> {
  __$$_AssetIconCopyWithImpl(
      _$_AssetIcon _value, $Res Function(_$_AssetIcon) _then)
      : super(_value, (v) => _then(v as _$_AssetIcon));

  @override
  _$_AssetIcon get _value => super._value as _$_AssetIcon;

  @override
  $Res call({
    Object? assetId = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_AssetIcon(
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

class _$_AssetIcon implements _AssetIcon {
  const _$_AssetIcon({required this.assetId, required this.url});

  @override
  final String assetId;
  @override
  final String url;

  @override
  String toString() {
    return 'AssetIcon(assetId: $assetId, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetIcon &&
            const DeepCollectionEquality().equals(other.assetId, assetId) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(assetId),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_AssetIconCopyWith<_$_AssetIcon> get copyWith =>
      __$$_AssetIconCopyWithImpl<_$_AssetIcon>(this, _$identity);
}

abstract class _AssetIcon implements AssetIcon {
  const factory _AssetIcon(
      {required final String assetId,
      required final String url}) = _$_AssetIcon;

  @override
  String get assetId => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AssetIconCopyWith<_$_AssetIcon> get copyWith =>
      throw _privateConstructorUsedError;
}
