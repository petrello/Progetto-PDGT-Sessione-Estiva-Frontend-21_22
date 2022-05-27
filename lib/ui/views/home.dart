import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pdgt_frontend/application/dio_client.dart';
import 'package:pdgt_frontend/domain/entities/asset_icon.dart';
import '../widgets/balance_panel.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../widgets/actions/actions_bar.dart';
import '../widgets/chart/homepage_chart.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  double balance = 66032206.10;
  double profit = 35.22;
  double profitPercent = 0.22;

  final DioClient dioClient = DioClient();
  List<AssetIcon>? assetIconList;

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
          leading: SizedBox(
            height: 10.w,
            width: 15.w,
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 15.w,
          title: Text(
              'App Trading',
              style: TextStyle(color: themeData.primaryColor,)
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 2.w ,bottom: 1.w, right: 5.w),
              child: SizedBox(
                height: 3.h,
                width: 10.w,
                child: InkWell(
                  onTap: () => {}, // TODO: implement help function
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeData.primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        FeatherIcons.bell,
                        color: themeData.primaryColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ListView(
            children: [
              Center(
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async => {

                          assetIconList = await dioClient.getAllAssetsIcons(),
                          print('asset ->>>>>> $assetIconList'),
                          print('first ->>>_-_>_ ${assetIconList?.first.assetId}')
                        },
                        child: Text('${assetIconList?.first.assetId}'),
                    ),
                  ],
                ),
              ),
              balancePanel(balance, profit, profitPercent, themeData),
              actionsWidget(themeData),
              // TODO: wrap this stuff in a ChartHomeWall widget
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
            ],
          ),
        ),
      ),
    );
  }
  
}