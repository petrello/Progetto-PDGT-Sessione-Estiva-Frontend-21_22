import 'package:client_crypto/data/asset_dto.dart';

/**
 * use the repository pattern because I want to abstract the usage
 * of the class that will provide the requested information,
 * and with that we are going to depend
 * on the abstraction and not the implementation of that.
 */

abstract class IRepository {
  Future<AssetDTO> retreiveAsset();
}