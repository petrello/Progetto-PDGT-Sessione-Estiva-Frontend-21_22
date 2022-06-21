/*
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
}*/

class Asset {
  final String       id;
  final String       asset_id;
  final String       name;
  final String       icon;
  final double       percentage_change;
  final double       price;
  final String       exchange_currency;
  final String       period_id;
  final String       duration_id;
  final String     time_period_start;
  final String     time_period_end;
  final List<dynamic> plot_rate;
  final int v;

  Asset({
    required this.id,
    required this.asset_id,
    required this.name,
    required this.icon,
    required this.percentage_change,
    required this.price,
    required this.exchange_currency,
    required this.period_id,
    required this.duration_id,
    required this.time_period_start,
    required this.time_period_end,
    required this.plot_rate,
    required this.v,
  });
  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['_id'],
      asset_id: json['asset_id'],
      name: json['name'],
      icon: json['icon'],
      percentage_change: json['percentage_change'],
      price: json['price'],
      exchange_currency: json['exchange_currency'],
      period_id: json['period_id'],
      duration_id: json['duration_id'],
      time_period_start: json['time_period_start'],
      time_period_end: json['time_period_end'],
      plot_rate: json['plot_rate'],
      v: json["__v"]
    );
  }

  String toString() {
    return '{asset_id: $asset_id, name: $name}';
  }

  /*toJson() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'surname': surname,
      'email': email,
      'createdOn': createdOn
    };
  }*/
}