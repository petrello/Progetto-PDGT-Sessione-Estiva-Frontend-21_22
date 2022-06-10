import 'package:client_crypto/data/asset_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('/assets')
  Future<List<AssetDTO>> getAllAssets() async {
    late List<AssetDTO> list;
    return list;
  }

  @GET('/assets/:asset_id')
  Future<AssetDTO> getAssetById({required String assetId});
}