import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol.freezed.dart';
part 'symbol.g.dart';

@freezed
class SymbolDTO with _$SymbolDTO {
  const factory SymbolDTO({
    required String symbolId,
    required String exchangeId,
    required String symbolType,
    required String assetIdBase,
    required String assetIdQuote,
    required String assetIdUnit,
    required String futureContractUnit,
    required String futureContractUnitAsset,
    required String dataStart,
    required String dataEnd,
    required String dataQuoteStart,
    required String dataQuoteEnd,
    required String dataOrderbookStart,
    required String dataOrderbookEnd,
    required String dataTradeStart,
    required String dataTradeEnd,
    required int    volume1hrs,
    required int    volume1hrsUsd,
    required int    volume1day,
    required int    volume1dayUsd,
    required int    volume1mth,
    required int    volume1mthUsd,
    required int    price,
    required String symbolIdExchange,
    required String assetIdBaseExchange,
    required String assetIdQuoteExchange,
    required int    pricePrecision,
    required int    sizePrecision,
  }) = _SymbolDTO;

  factory SymbolDTO.fromJson(Map<String, dynamic> json) =>
      _$SymbolDTOFromJson(json);
}