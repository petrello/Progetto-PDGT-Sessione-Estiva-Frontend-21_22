
import 'package:client_crypto/models/asset_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioClient {

  final Dio _dio = Dio();
  static const _baseUrl = 'http://localhost:4000/';
  static const _baseEndpoint = 'userList/assets';


  Future<Asset> getAssetById({required String assetId}) async {
    try {
      final response = await _dio.get(_baseUrl + _baseEndpoint + '$assetId');
      print("Response from getAssetById: " + response.toString());
      if (response.statusCode == 200) print("Tutto ok: statusCode 200");
      return Asset.fromJson(response.data);
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
      final List<dynamic> list = response.data;
      return List<Asset>.from(list.map((asset) => Asset.fromJson(asset)));
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
      return Asset.fromJson(response.data);
    } on DioError catch (e) {
      printError(info: e.message);
      throw Exception("Fail to add asset");
    }
  }

  Future<Asset> modifyExchangeCurrency(
      {required String newCurrency, required Asset currentAsset}) async {
    try {
      final response = await _dio.put(
          "$_baseUrl$_baseEndpoint/${currentAsset.asset_id}",
          data: {
            "asset_id": currentAsset.asset_id,
            "name": currentAsset.name,
            "icon": currentAsset.icon,
            "percentage_cange": currentAsset.percentage_change,
            "price": currentAsset.price,
            "exchange_currency": newCurrency,
            "period_id": currentAsset.period_id,
            "duration_id": currentAsset.duration_id,
            "time_period_start": currentAsset.time_period_start,
            "time_period_end": currentAsset.time_period_end,
          });
      print("Response from modifyExchangeCurrency: " + response.toString());
      if (response.statusCode == 201) print("Tutto ok: statusCode 201");
      return Asset.fromJson(response.data);
    } on DioError catch (e) {
      print("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Fail to add asset");
    }
  }

  Future<Asset> modifyTimePeriod(
      {required String newDuration, required Asset currentAsset}) async {
    try {
      final response = await _dio.put(
          "$_baseUrl$_baseEndpoint/${currentAsset.asset_id}",
          data: {
            "asset_id": currentAsset.asset_id,
            "name": currentAsset.name,
            "icon": currentAsset.icon,
            "percentage_cange": currentAsset.percentage_change,
            "price": currentAsset.price,
            "exchange_currency": currentAsset.exchange_currency,
            "period_id": currentAsset.period_id,
            "duration_id": newDuration,
            "time_period_start": currentAsset.time_period_start,
            "time_period_end": currentAsset.time_period_end,
          });
      print("Response from modifyExchangeCurrency: " + response.toString());
      if (response.statusCode == 201) print("Tutto ok: statusCode 201");
      return Asset.fromJson(response.data);
    } on DioError catch (e) {
      print("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Fail to add asset");
    }
  }

  Future<Asset> deleteAssetById({required String id}) async {
    try {
      final response = await _dio.delete("$_baseUrl$_baseEndpoint/$id");
      print("Response from modifyExchangeCurrency: " + response.toString());
      if (response.statusCode == 201) print("Tutto ok: statusCode 201");
      return Asset.fromJson(response.data);
    } on DioError catch (e) {
      print("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Fail to add asset");
    }
  }
}