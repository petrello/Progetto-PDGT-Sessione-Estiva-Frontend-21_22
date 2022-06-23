import 'package:client_crypto/models/asset_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'crypto_icon.dart';
import 'profit_percentage.dart';
import 'package:sizer/sizer.dart';
import 'package:client_crypto/ui/widgets/chart/homepage_chart.dart';
import 'package:fl_chart/fl_chart.dart';

class WallChartWidget extends StatelessWidget {

  final bool? isHomePage;
  final List<Asset>? assetsList;
  final ThemeData? themeData;

  const WallChartWidget({
    super.key,
    this.isHomePage,
    this.assetsList,
    this.themeData,
  });

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: assetsList?.length,
          itemBuilder: (context, index) {
            if(assetsList!.isNotEmpty) {
              List<FlSpot> spots = assetsList![index].plot_rate.asMap().entries.map((e) {
                return FlSpot(e.key.toDouble(), e.value);
              }).toList();
              print("STAMPA SPOT " + spots.toString());
              return ChartHomeWidget(
                isHomePage: isHomePage!,
                assetId: assetsList![index].asset_id,
                assetIcon: assetsList![index].icon,
                assetName: assetsList![index].name,
                percentageChange: assetsList![index].percentage_change,
                exchangeCurrency: assetsList![index].exchange_currency,
                spots: spots,
                themeData: themeData,
              );
            }
            else {
              return const Center(
                  heightFactor: 10,
                  child: Text("EMPTY LIST"),
              );
            }
          }
      );

  }
}
/*
ChartHomeWidget(
assetId: "NO ASSET ID",
assetIcon: "NONE",
assetName: "NO NAME",
percentageChange: -0.0,
exchangeCurrency: "NO CURRENCY",
spots: [],
themeData: themeData,
);*/

/*
children: [
chartHomePage(
true,
Icons.favorite,
'Ethereum',
'ETH',
'USD',
const [
FlSpot(0, 2550.18),
FlSpot(1, 2500.34),
FlSpot(2, 2541.34),
FlSpot(3, 2540.59),
FlSpot(4, 2550.60),
FlSpot(5, 2639.80),
FlSpot(6, 2523.71),
],
themeData,
),
chartHomePage(
true,
Icons.favorite,
'Bitcoin',
'BTC',
'USD',
const [
FlSpot(0, 40005.71),
FlSpot(1, 40875.23),
FlSpot(2, 40800.59),
FlSpot(3, 40875.12),
FlSpot(4, 41875.72),
FlSpot(5, 40375.49),
FlSpot(6, 40700.58),
],
themeData,
),
chartHomePage(
true,
Icons.favorite,
'Dogecoin',
'DOGE',
'PLN',
const [
FlSpot(0, 0.22),
FlSpot(1, 0.24),
FlSpot(2, 0.28),
FlSpot(3, 0.30),
FlSpot(4, 0.35),
FlSpot(5, 0.52),
FlSpot(6, 0.58),
],
themeData,
),
chartHomePage(
true,
Icons.favorite,
'Litecoin',
'LTC',
'USD',
const [
FlSpot(0, 100.40),
FlSpot(1, 102.34),
FlSpot(2, 98.23),
FlSpot(3, 100.23),
FlSpot(4, 102.10),
FlSpot(5, 103.85),
FlSpot(6, 103.20),
],
themeData,
),
],);*/
