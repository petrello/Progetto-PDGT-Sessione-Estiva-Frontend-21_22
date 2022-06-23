import 'package:client_crypto/ui/widgets/actions/remove_crypto_dialog.dart';

import '../../views/detailed.dart';
import '../profit_percentage.dart';
import './chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';


class ChartHomeWidget extends StatelessWidget {

  final bool isHomePage;
  final String assetId;
  final String assetIcon;
  final String assetName;
  final double percentageChange;
  final String exchangeCurrency;
  final List<FlSpot> spots;
  final ThemeData? themeData;

  const ChartHomeWidget({
    super.key,
    required this.isHomePage,
    required this.assetId,
    required this.assetIcon,
    required this.assetName,
    required this.percentageChange,
    required this.exchangeCurrency,
    required this.spots,
    this.themeData,
  });

  @override
  Widget build(BuildContext context) {

    Rx<double> minY = 0.0.obs;
    Rx<double> maxY = 0.0.obs;
    List sortedSpots = spots.toList();
    sortedSpots.sort((a, b) => a.y.compareTo(b.y));
    minY.value = sortedSpots.first.y;
    maxY.value = sortedSpots.last.y;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GestureDetector(
          onTap: () => Get.to(
                () => DetailsPage(
              assetIcon: assetIcon,
              assetName: assetName,
              assetId: assetId,
              exchangeCurrency: exchangeCurrency,
              spots: spots,
              percentageChange: percentageChange,
              maxY: maxY.value,
              minY: minY.value,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2.h,
                horizontal: 2.w,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          assetIcon,
                          width: 5.w
                        ),
                        /*Icon(
                          cryptoIcon,
                          size: 15.sp,
                          color: Colors.white,
                        ),*/
                        Padding(
                          padding: EdgeInsets.only(left: 1.w),
                          child: SizedBox(
                            width: 40.w,
                            child: Text(
                              '$assetName ($assetId)',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Transform.scale(
                            scale: 0.9,
                            child: profitPercentageWidget(percentageChange)
                        ),
                        IconButton(
                          icon: const Icon(FeatherIcons.trash2),
                          onPressed: () {
                            displayRemoveCryptoDialog(assetId, themeData!);
                            // TODO: apri modulo -> Sicuro di cancellare? SI, NO
                            // se NO => chiudi modulo
                            // se SI => invoca API con Dio e rimuovi e aggiorna
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                    child: SizedBox(
                      width: 90.w,
                      height: 10.h,
                      child: LineChart(
                        chart(
                            isHomePage,
                            spots,
                            minY.value,
                            maxY.value,
                            percentageChange >= 0)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
