
import 'package:client_crypto/models/asset_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioClient {

  // for dev propouse
  //static const _baseUrl = 'http://localhost:80/';

  static const _baseUrl = 'https://pdgt-crypto-app-api.herokuapp.com';
  static const _baseEndpoint = '/userList/assets';
  final Dio _dio = Dio();

  Future<Asset> getAssetById({required String assetId}) async {
    try {
      final response = await _dio.get('$_baseUrl$_baseEndpoint/$assetId');
      print("Response from getAssetById: " + response.toString());
      if (response.statusCode == 200) print("Tutto ok: statusCode 200");
      return Asset.fromJson(response.data["data"]);
    } on DioError catch (e) {
      printError(info: e.message);
      throw Exception("Fail to fetch the asset: $assetId");
    }
  }

  Future<List<Asset>> getAllAsstes() async {
    try {
      final response = await _dio.get("$_baseUrl$_baseEndpoint");
      print("Response from getAllAssets: " + response.toString());
      if (response.statusCode == 200) print("Tutto ok: statusCode 200");
      // response.data -> List<dynamic>
      print("------------------------------RESPonse data" + response.data["data"].toString());
      print("TYPEEEE " + response.data["data"].runtimeType.toString());
      /*final Map<String, dynamic> mappa = response.data;
      print("MAPPAPAPAPPAPAPPAPA " + mappa.toString());
      print("MAPAPAPAP " + mappa["data"].toString());*/
      final List<dynamic> list = response.data["data"];
      print("><<>>>LISTA________ " + list.toString());

      List<Asset> listAsset = [];

      for(int i = 0; i <list.length; i++) {
        print("----------òòòòò LISTA CHE ITERAAAA " + list.toString());
        Map<String, dynamic> map = list[i];
        print(Asset.fromJson(map));
        print("MAPPAa -- " + map["asset_id"] +"?? ?? ? ?? ? ?" + map.toString());
        listAsset.add(Asset.fromJson(map));

        print('Id------- ' + map["asset_id"] + "");
      }

      print("!!!!! WWWWW  WWWW  importante!!!!!!" + listAsset[0].toString());

      //final List<Asset> listaAsset = list.map<Asset>((asset) => {print("ASSET" + asset.toString(), Asset.fromJson(asset)}));

      print("TIPEETTOT " + listAsset.runtimeType.toString());
      //return List<Asset>.from(list.map((asset) => {print("ASSET" + asset), Asset.fromJson(asset)}));
      return listAsset;
    } on DioError catch (e) {
      printError(info: e.message);
      throw Exception("Fail to fetch all assets");
    }
  }

  Future<Asset> addNewAsset({required String assetId}) async {
    try {
      final response = await _dio.post("$_baseUrl$_baseEndpoint",
          data: {
            "asset_id": assetId,
          });
      print("Response from addNewAsset: " + response.toString());
      if (response.statusCode == 201) print("Tutto ok: statusCode 201");
      return Asset.fromJson(response.data["data"]);
    } on DioError catch (e) {
      printError(info: e.message);
      throw Exception("Fail to add asset");
    }
  }

  Future<Asset> modifyExchangeCurrency({
        required String assetId,
        required String durationId,
        required String timePeriodEnd,
        required String timePeriodStart,
        required String periodId,
        required String newExchangeCurrency }) async {
    try {
      final response = await _dio.put(
          "$_baseUrl$_baseEndpoint/exchangerate/${assetId}",
          data: {
            "exchange_currency": newExchangeCurrency,
            "period_id": periodId,
            "duration_id": durationId,
            "time_period_start": timePeriodStart,
            "time_period_end": timePeriodEnd,
          });
      print("Response from modifyExchangeCurrency: " + response.toString());
      if (response.statusCode == 200) print("Tutto ok: statusCode 200");
      return Asset.fromJson(response.data["data"]);
    } on DioError catch (e) {
      print("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Fail to change the currency");
    }
  }

  Future<Asset> modifyTimePeriod({
        required String assetId,
        required String newDuration,
        required String exchangeCurrency
      }) async {
    try {
      final response = await _dio.put(
          "$_baseUrl$_baseEndpoint/history/$assetId",
          data: {
            "asset_id": assetId,
            "duration_id": newDuration,
            "exchange_currency": exchangeCurrency
          });
      print("Response from change PERIOD: " + response.toString());
      if (response.statusCode == 200) print("Tutto ok: statusCode 200");
      print("Response from change PERIOD: " + response.data["data"].toString());
      return Asset.fromJson(response.data["data"]);
    } on DioError catch (e) {
      print("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Fail to change the period time");
    }
  }

  Future<Asset> deleteAssetById({required String assetId}) async {
    try {
      final response = await _dio.delete("$_baseUrl$_baseEndpoint/$assetId");
      print("Response from modifyExchangeCurrency: " + response.toString());
      if (response.statusCode == 200) print("Tutto ok: statusCode 200");
      print("ASSET ID REMOVED " + assetId);
      return Asset.fromJson(response.data["data"]);
    } on DioError catch (e) {
      print("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Fail to add asset");
    }
  }
}