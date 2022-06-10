import 'package:client_crypto/api/dio_client.dart';
import 'package:client_crypto/models/asset_model.dart';
import 'package:client_crypto/ui/widgets/actions/actions_bar.dart';
import 'package:client_crypto/ui/widgets/wall_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  // devo avere un'istanza di DioClient
  final DioClient _dio = DioClient();
  // contains all the user's assets
  late List<Asset>? _assetsList = [];

  Future<void> _getAssets() async {
    _assetsList = await _dio.getAllAsstes();
  }

  @override
  void initState()  {
    super.initState();
    // inizializzo la lista
    _getAssets();
  }

  /*final DioClient dioClient = DioClient();
  List<AssetIcon>? assetIconList;*/

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
              height: 10.h,
              width: 15.w,
            ),
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            leadingWidth: 15.w,
            title: Image.asset(
              themeData.brightness == Brightness.light
                  ? 'assets/logo_light_theme-removebg-preview.png'
                  : 'assets/logo_dark_theme-removebg-preview.png',
              height: 10.5.h,
            ),
            centerTitle: true,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Column(
              children: [
                actionsWidget(themeData),
                _assetsList == null || _assetsList!.isEmpty
                ? Center(heightFactor: 10, child: CircularProgressIndicator()) :
                WallChartWidget(
                  assetsList: _assetsList,
                  themeData: themeData,
                ),
              ],
            ),
          ),
        ),
      );
  }
  
}