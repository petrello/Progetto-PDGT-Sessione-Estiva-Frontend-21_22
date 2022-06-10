import 'package:client_crypto/application/api.dart';
import 'package:client_crypto/data/asset_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IAssetRepository {
  Future<List<AssetDTO>> getAllAssets();
  Future<AssetDTO> getAssetById(String id);
}

class AssetRepository implements IAssetRepository {

  final Reader _read;
  final Api _api;

  const AssetRepository(this._api, this._read);

  @override
  Future<List<AssetDTO>> getAllAssets() => _api.getAllAssets();

  @override
  Future<AssetDTO> getAssetById(String id) => _api.getAssetById(assetId: id);
}