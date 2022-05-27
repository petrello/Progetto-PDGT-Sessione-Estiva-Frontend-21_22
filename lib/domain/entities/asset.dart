import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';

@freezed
class Asset with _$Asset {
  const factory Asset({
    required String assetId,
    required String name,
    required bool   typeIsCrypto,
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
    required int    priceUsd,
  }) = _Asset;
}