import 'package:client_crypto/application/api.dart';
import 'package:client_crypto/application/irepository.dart';
import 'package:client_crypto/data/asset_dto.dart';

class Repository implements IRepository {
  Repository(this._api);
  final Api _api;

  @override
  Future<AssetDTO> retreiveAsset() => _api.retrieveAsset();
}