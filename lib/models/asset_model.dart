import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
class Asset with _$Asset {
  const factory Asset({
    required String       id,
    required String       asset_id,
    required String       name,
    required String       icon,
    required double       percentage_change,
    required double       price,
    required String       exchange_currency,
    required String       period_id,
    required String       duration_id,
    required DateTime     time_period_start,
    required DateTime     time_period_end,
    required List<double> plot_rate,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) =>
      _$AssetFromJson(json);
}