import 'package:client_crypto/data/asset_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('asset')
  Future<AssetDTO> retrieveAsset();
}