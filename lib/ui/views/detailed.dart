import 'package:client_crypto/api/dio_client.dart';
import 'package:client_crypto/models/asset_model.dart';

import '../widgets/chart/chart.dart';
import '../widgets/chart/sort_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class DetailsPage extends StatefulWidget {

  final String assetIcon;
  final String assetName;
  final String assetId;
  String exchangeCurrency;
  List<FlSpot> spots;
  double percentageChange;
  final double minY;
  final double maxY;

  DetailsPage({
    Key? key,
    required this.assetIcon,
    required this.assetName,
    required this.assetId,
    required this.exchangeCurrency,
    required this.spots,
    required this.percentageChange,
    required this.minY,
    required this.maxY,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  late RxDouble minY;
  late RxDouble maxY;

  late Asset _currentAsset;
  late Future<List<FlSpot>> _flSpotsRate;
  late Future<String> _newCurrency;

  void getCurrentAsset() async {
    _currentAsset = await DioClient().getAssetById(assetId: widget.assetId);
    print("CURRENT ASSEt ----- " + _currentAsset.toString());
  }

  @override
  void initState() {
    getCurrentAsset();
    // di default il la durata dello storico è 1DAY
    _flSpotsRate = Future.value(widget.spots);
    _newCurrency = Future.value(widget.exchangeCurrency);
    minY = widget.minY.obs;
    maxY = widget.maxY.obs;
    super.initState();
  }

  Future<List<FlSpot>> _getPlotRate(int periodIndex) async {
    if (periodIndex != periodSelectedSort.value) {
      periodSelectedSort.value = periodIndex;
      Asset? newAsset;
      List<FlSpot>? spots;
      if (periodIndex == 0) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1HRS",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (periodIndex == 1) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1DAY",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (periodIndex == 2) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1WEK",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (periodIndex == 3) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1MTH",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (periodIndex == 4) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1YER",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      }
      setState(() {
        widget.exchangeCurrency = newAsset!.exchange_currency;
        widget.percentageChange = newAsset.percentage_change;
        widget.spots = spots!;
        _currentAsset = newAsset;
        print("ASSET UPDATED ++++++ " + _currentAsset.plot_rate.last);
      });
      return spots!;
    }
    return [];
  }

  Future<String> _getNewCurrency(int currencyIndex) async {
    if (currencyIndex != currencySelectedSort.value) {
      currencySelectedSort.value = currencyIndex;
      Asset? newAsset;
      String newCurrency;
      List<FlSpot>? spots;
      newAsset = await DioClient().modifyExchangeCurrency(
        assetId: widget.assetId,
        durationId: _currentAsset.duration_id,
        newExchangeCurrency: currencyStrings[currencyIndex],
        periodId: _currentAsset.period_id,
        timePeriodEnd: _currentAsset.time_period_end,
        timePeriodStart: _currentAsset.time_period_start,
      );
      spots = newAsset.plot_rate.asMap().entries.map((e) {
        return FlSpot(e.key.toDouble(), e.value);
      }).toList();
      newCurrency = currencyStrings[currencyIndex];
      /*if (currencyIndex == 0) {
        newAsset = await DioClient().modifyExchangeCurrency(
            assetId: widget.assetId,
            durationId: _currentAsset.duration_id,
            newExchangeCurrency: "USD",
            periodId: _currentAsset.period_id,
            timePeriodEnd: _currentAsset.time_period_end,
            timePeriodStart: _currentAsset.time_period_start,
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (currencyIndex == 1) {
        newAsset = await DioClient().modifyExchangeCurrency(
          assetId: widget.assetId,
          durationId: _currentAsset.duration_id,
          newExchangeCurrency: "EUR",
          periodId: _currentAsset.period_id,
          timePeriodEnd: _currentAsset.time_period_end,
          timePeriodStart: _currentAsset.time_period_start,
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (currencyIndex == 2) {
        newAsset = await DioClient().modifyExchangeCurrency(
          assetId: widget.assetId,
          durationId: _currentAsset.duration_id,
          newExchangeCurrency: "JPY",
          periodId: _currentAsset.period_id,
          timePeriodEnd: _currentAsset.time_period_end,
          timePeriodStart: _currentAsset.time_period_start,
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (currencyIndex == 3) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1MTH",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (currencyIndex == 4) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1YER",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (currencyIndex == 5) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1YER",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (currencyIndex == 6) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1YER",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (currencyIndex == 7) {
        newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1YER",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      }*/
      setState(() {
        widget.exchangeCurrency = newAsset!.exchange_currency;
        widget.percentageChange = newAsset.percentage_change;
        widget.spots = spots!;
        _currentAsset = newAsset;
        print("ASSET UPDATED ++++++ " + _currentAsset.exchange_currency);
      });
      return newCurrency;
    }
    return "";
  }

  /*void changeSortingPeriod(int periodIndex) async {

    spots.value = await _getPlotRate(periodIndex);
    print("new spots::: " + spots.toString());

    *//*if (periodIndex != selectedSort.value) {
      selectedSort.value = periodIndex;
      if (periodIndex == 0) {
         Asset newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1HRS",
            exchangeCurrency: widget.exchangeCurrency
          );
         print("ASSET::: " + newAsset.toString());
         print("DURATION::: " + newAsset.duration_id);
         spots.value = newAsset.plot_rate.asMap().entries.map((e) {
           return FlSpot(e.key.toDouble(), e.value);
         }).toList();
      } else if (periodIndex == 1) {
        Asset newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1DAY",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots.value = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (periodIndex == 2) {
        Asset newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1WEK",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots.value = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (periodIndex == 3) {
        Asset newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1MTH",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots.value = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      } else if (periodIndex == 4) {
        Asset newAsset = await DioClient().modifyTimePeriod(
            assetId: widget.assetId,
            newDuration: "1YER",
            exchangeCurrency: widget.exchangeCurrency
        );
        spots.value = newAsset.plot_rate.asMap().entries.map((e) {
          return FlSpot(e.key.toDouble(), e.value);
        }).toList();
      }
    }*//*

    List sortedSpots = spots;
    sortedSpots.sort((a, b) => a.y.compareTo(b.y));
    minY.value = sortedSpots.first.y;
    maxY.value = sortedSpots.last.y;
  }*/

  Rx<double> totalSpotsValue = 0.0.obs;
  Rx<int> periodSelectedSort = 1.obs;
  Rx<int> currencySelectedSort = 0.obs;

  List sortStrings = [
    '1H',
    '1D',
    '1W',
    '1M',
    '1Y',
  ];
  List currencyStrings = [
    'USD',
    'EUR',
    'JPY',
    'GBP',
    'CNY',
    'CHF',
    'KRW',
    'RUB'
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.backgroundColor,
          leading: Padding(
            padding: EdgeInsets.only(top: 2.w ,bottom: 1.w, left: 5.w),
            child: SizedBox(
              height: 3.5.h,
              width: 10.w,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FeatherIcons.arrowLeft,
                      color: themeData.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 15.w,
          title: Text(
            widget.assetName,
            style: GoogleFonts.lato(
              color: themeData.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeData.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      /*child: Icon(
                        widget.cryptoIcon,
                        size: 80.sp,
                      ),*/
                      child: Image.network(
                        widget.assetIcon,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: Center(
                child: Text(
                  widget.spots.last.y.toStringAsFixed(2).replaceFirst('.', ',').replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.'),
                  style: GoogleFonts.lato(
                    letterSpacing: 1,
                    color: themeData.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                ' ${widget.assetId}/${widget.exchangeCurrency}',
                style: GoogleFonts.lato(
                  letterSpacing: 1,
                  color: themeData.primaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.sp,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.percentageChange >= 0
                      ? FeatherIcons.trendingUp
                      : FeatherIcons.trendingDown,
                  color: widget.percentageChange >= 0
                      ? Colors.green[600]
                      : Colors.red[600],
                  size: 20.sp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    '${widget.percentageChange.toStringAsFixed(2).replaceFirst('.', ',')}%',
                    style: GoogleFonts.poppins(
                      color: widget.percentageChange >= 0
                          ? Colors.green[600]
                          : Colors.red[600],
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
              child: Center(
                child: Container(
                  width: 95.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: SizedBox(
                        width: 85.w,
                        height: 30.h,
                        child: FutureBuilder(
                          future: _flSpotsRate,
                          builder: (context, AsyncSnapshot<List<FlSpot>> snapshot) {
                            if(!snapshot.hasData) {
                              print('DATA:::::' + snapshot.data.toString());
                              print("SNAP " + snapshot.toString());
                              return const Center(
                                  heightFactor: 10,
                                  child: CircularProgressIndicator()
                              );
                            }
                            else if(snapshot.hasError) {
                              return const Center(
                                heightFactor: 10,
                                child: Text("ERROR"),
                              );
                            }
                            else {
                              return LineChart(
                                chart(
                                  false,
                                  snapshot.data!,
                                  minY.value,
                                  maxY.value,
                                  widget.percentageChange >= 0,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: SizedBox(
                height: 5.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sortStrings.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Obx(() => i == periodSelectedSort.value
                        ? GestureDetector(
                        onTap: () => setState(() {_flSpotsRate = _getPlotRate(i);}),
                        child: chartSortWidget(
                            sortStrings[i], true, themeData))
                        : GestureDetector(
                        onTap: () => setState(() {_flSpotsRate = _getPlotRate(i);}),
                        child: chartSortWidget(
                            sortStrings[i], false, themeData))
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
              child: SizedBox(
                height: 5.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: currencyStrings.length,
                  itemBuilder: (BuildContext context, int y) {
                    return Obx(() => y == currencySelectedSort.value
                        ? GestureDetector(
                        onTap: () => setState(() {_newCurrency = _getNewCurrency(y);}),
                        child: chartSortWidget(
                            currencyStrings[y], true, themeData))
                        : GestureDetector(
                        onTap: () => setState(() {_newCurrency = _getNewCurrency(y);}),
                        child: chartSortWidget(
                            currencyStrings[y], false, themeData))
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}