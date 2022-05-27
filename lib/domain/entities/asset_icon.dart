import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_icon.freezed.dart';

@freezed
class AssetIcon with _$AssetIcon {
  const factory AssetIcon({
    required String assetId,
    required String url,
  }) = _AssetIcon;
}