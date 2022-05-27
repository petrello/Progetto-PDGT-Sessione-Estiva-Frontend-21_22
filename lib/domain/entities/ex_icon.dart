import 'package:freezed_annotation/freezed_annotation.dart';

part 'ex_icon.freezed.dart';

@freezed
class ExIcon with _$ExIcon {
  const factory ExIcon({
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
  }) = _ExIcon;
}