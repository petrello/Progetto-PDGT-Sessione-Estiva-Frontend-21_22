import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdgt_frontend/domain/entities/asset_icon.dart';

part 'asset_icon.freezed.dart';
part 'asset_icon.g.dart';

@freezed
class AssetIconDTO with _$AssetIconDTO {
  const factory AssetIconDTO({
    required String assetId,
    required String url,
  }) = _AssetIconDTO;

  factory AssetIconDTO.fromJson(Map<String, dynamic> json) =>
      _$AssetIconDTOFromJson(json);
}

extension AssetIconDTOX on AssetIconDTO {
  AssetIcon toDomain() {
    return AssetIcon(
      assetId: assetId,
      url: url,
    );
  }
}

