// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SymbolDTO _$$_SymbolDTOFromJson(Map<String, dynamic> json) => _$_SymbolDTO(
      symbolId: json['symbolId'] as String,
      exchangeId: json['exchangeId'] as String,
      symbolType: json['symbolType'] as String,
      assetIdBase: json['assetIdBase'] as String,
      assetIdQuote: json['assetIdQuote'] as String,
      assetIdUnit: json['assetIdUnit'] as String,
      futureContractUnit: json['futureContractUnit'] as String,
      futureContractUnitAsset: json['futureContractUnitAsset'] as String,
      dataStart: json['dataStart'] as String,
      dataEnd: json['dataEnd'] as String,
      dataQuoteStart: json['dataQuoteStart'] as String,
      dataQuoteEnd: json['dataQuoteEnd'] as String,
      dataOrderbookStart: json['dataOrderbookStart'] as String,
      dataOrderbookEnd: json['dataOrderbookEnd'] as String,
      dataTradeStart: json['dataTradeStart'] as String,
      dataTradeEnd: json['dataTradeEnd'] as String,
      volume1hrs: json['volume1hrs'] as int,
      volume1hrsUsd: json['volume1hrsUsd'] as int,
      volume1day: json['volume1day'] as int,
      volume1dayUsd: json['volume1dayUsd'] as int,
      volume1mth: json['volume1mth'] as int,
      volume1mthUsd: json['volume1mthUsd'] as int,
      price: json['price'] as int,
      symbolIdExchange: json['symbolIdExchange'] as String,
      assetIdBaseExchange: json['assetIdBaseExchange'] as String,
      assetIdQuoteExchange: json['assetIdQuoteExchange'] as String,
      pricePrecision: json['pricePrecision'] as int,
      sizePrecision: json['sizePrecision'] as int,
    );

Map<String, dynamic> _$$_SymbolDTOToJson(_$_SymbolDTO instance) =>
    <String, dynamic>{
      'symbolId': instance.symbolId,
      'exchangeId': instance.exchangeId,
      'symbolType': instance.symbolType,
      'assetIdBase': instance.assetIdBase,
      'assetIdQuote': instance.assetIdQuote,
      'assetIdUnit': instance.assetIdUnit,
      'futureContractUnit': instance.futureContractUnit,
      'futureContractUnitAsset': instance.futureContractUnitAsset,
      'dataStart': instance.dataStart,
      'dataEnd': instance.dataEnd,
      'dataQuoteStart': instance.dataQuoteStart,
      'dataQuoteEnd': instance.dataQuoteEnd,
      'dataOrderbookStart': instance.dataOrderbookStart,
      'dataOrderbookEnd': instance.dataOrderbookEnd,
      'dataTradeStart': instance.dataTradeStart,
      'dataTradeEnd': instance.dataTradeEnd,
      'volume1hrs': instance.volume1hrs,
      'volume1hrsUsd': instance.volume1hrsUsd,
      'volume1day': instance.volume1day,
      'volume1dayUsd': instance.volume1dayUsd,
      'volume1mth': instance.volume1mth,
      'volume1mthUsd': instance.volume1mthUsd,
      'price': instance.price,
      'symbolIdExchange': instance.symbolIdExchange,
      'assetIdBaseExchange': instance.assetIdBaseExchange,
      'assetIdQuoteExchange': instance.assetIdQuoteExchange,
      'pricePrecision': instance.pricePrecision,
      'sizePrecision': instance.sizePrecision,
    };
