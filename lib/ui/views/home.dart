import 'package:client_crypto/api/dio_client.dart';
import 'package:client_crypto/models/asset_model.dart';
import 'package:client_crypto/ui/widgets/actions/actions_bar.dart';
import 'package:client_crypto/ui/widgets/wall_chart_widget.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  // devo avere un'istanza di DioClient
  //final DioClient _dio = DioClient();
  /*// contains all the user's assets
  late List<Asset>? _assetsList = [];

  Future<void> _getAssets() async {
    _assetsList = await _dio.getAllAsstes();
  }

  @override
  void initState()  {
    super.initState();
    // inizializzo la lista
    _getAssets();
  }*/

  final DioClient _dioClient = DioClient();
  /*List<AssetIcon>? assetIconList;*/

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
            title: Text(
              'Crypto App 🦎',
              style: GoogleFonts.lato(
                color: themeData.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 32.sp,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: ListView(
              children: [
                actionsWidget(themeData),
                FutureBuilder(
                  future: _dioClient.getAllAsstes(),
                  builder: (context, AsyncSnapshot<List<Asset>> snapshot) {
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
                      return WallChartWidget(
                        isHomePage: true,
                        assetsList: snapshot.data,
                        themeData: themeData,
                      );
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      );
  }
  
}