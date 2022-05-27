import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange.freezed.dart';
part 'exchange.g.dart';

@freezed
class ExchangeDTO with _$ExchangeDTO {
  const factory ExchangeDTO({
    required String exchangeId,
    required String website,
    required String name,
    required String dataStart,
    required String dataEnd,
    required String dataQuoteStart,
    required String dataQuoteEnd,
    required String dataOrderbookStart,
    required String dataOrderbookEnd,
    required String dataTradeStart,
    required String dataTradeEnd,
    required int    dataSymbolsCount,
    required int    volume1hrsUsd,
    required int    volume1dayUsd,
    required int    volume1mthUsd,
  }) = _ExchangeDTO;

  factory ExchangeDTO.fromJson(Map<String, dynamic> json) =>
      _$ExchangeDTOFromJson(json);
}