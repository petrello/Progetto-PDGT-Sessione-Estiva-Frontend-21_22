import 'dart:convert';

import 'package:dio/dio.dart';
import '../domain/entities/asset_icon.dart';
import '../data/dto/asset_icon.dart';

class DioClient {

  final Dio _dio = Dio();
  static const _baseUrl = 'https://rest.coinapi.io/v1';
  static const _apiKey = 'BE6D370D-7FB6-45C5-81A3-AE07C8646C9E';

  // TODO: try to define a list of endpoints to use in the requests
  // final endpoints = ['/getAsset', ..... ];

  // GET - list of icons (of the given size) for all the assets
  Future<List<AssetIcon>> getAllAssetsIcons() async {
    // NOTA: 64 means that the icons' size will be 64px
    Response res = await _dio.get('$_baseUrl/assets/icons/64?apikey=$_apiKey');

    // Prints the raw data returned by the server
    print('User Info: ${res.data}');

    // Parsing the raw JSON data to the User class
    /*final dto = AssetIconDTO.fromJson(res.data);
    print('dto: $dto');*/
    //List<AssetIcon> assetsIcons = json.decode(res.data).map((dto) => AssetIconDTO.fromJson(dto)).toList();
    // List<AssetIcon> assetsIcons = res.data;
    var datalist = res.data as List; print(' data list --->>>>  $datalist');
    List<AssetIcon> assetsIcons = datalist.map((icon) {
      print('icon $icon');
      final dto = AssetIconDTO.fromJson(icon);
      print(dto);
      print(dto.toDomain());
      return dto.toDomain();
    }).toList();
    print(assetsIcons);
    //List<AssetIconDTO> list = (res.data as List).map((e) => AssetIconDTO.fromJson(e)).toList();
    //List<AssetIcon> assetsIcons = list.map((e) => e.toDomain()).toList();
    return assetsIcons;
  }

  /*Future<CryptocurrencyDTO> getCrypto({required String id}) async {
    // Perform GET request to the endpoint "/users/<id>"
    Response cryptoData = await _dio.get('$_baseUrl/v1/exchangerate/$id/USD?apikey=BE6D370D-7FB6-45C5-81A3-AE07C8646C9E');

    // Prints the raw data returned by the server
    print('User Info: ${cryptoData.data}');

    // Parsing the raw JSON data to the User class
    CryptocurrencyDTO crypto = CryptocurrencyDTO.fromJson(cryptoData.data);

    return crypto;
  }*/

}