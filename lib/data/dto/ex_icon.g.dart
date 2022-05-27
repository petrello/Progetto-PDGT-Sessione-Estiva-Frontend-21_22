// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExIconDTO _$$_ExIconDTOFromJson(Map<String, dynamic> json) => _$_ExIconDTO(
      exchangeId: json['exchangeId'] as String,
      website: json['website'] as String,
      name: json['name'] as String,
      dataStart: json['dataStart'] as String,
      dataEnd: json['dataEnd'] as String,
      dataQuoteStart: json['dataQuoteStart'] as String,
      dataQuoteEnd: json['dataQuoteEnd'] as String,
      dataOrderbookStart: json['dataOrderbookStart'] as String,
      dataOrderbookEnd: json['dataOrderbookEnd'] as String,
      dataTradeStart: json['dataTradeStart'] as String,
      dataTradeEnd: json['dataTradeEnd'] as String,
      dataSymbolsCount: json['dataSymbolsCount'] as int,
      volume1hrsUsd: json['volume1hrsUsd'] as int,
      volume1dayUsd: json['volume1dayUsd'] as int,
      volume1mthUsd: json['volume1mthUsd'] as int,
    );

Map<String, dynamic> _$$_ExIconDTOToJson(_$_ExIconDTO instance) =>
    <String, dynamic>{
      'exchangeId': instance.exchangeId,
      'website': instance.website,
      'name': instance.name,
      'dataStart': instance.dataStart,
      'dataEnd': instance.dataEnd,
      'dataQuoteStart': instance.dataQuoteStart,
      'dataQuoteEnd': instance.dataQuoteEnd,
      'dataOrderbookStart': instance.dataOrderbookStart,
      'dataOrderbookEnd': instance.dataOrderbookEnd,
      'dataTradeStart': instance.dataTradeStart,
      'dataTradeEnd': instance.dataTradeEnd,
      'dataSymbolsCount': instance.dataSymbolsCount,
      'volume1hrsUsd': instance.volume1hrsUsd,
      'volume1dayUsd': instance.volume1dayUsd,
      'volume1mthUsd': instance.volume1mthUsd,
    };
