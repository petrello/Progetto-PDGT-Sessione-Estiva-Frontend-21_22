import 'package:client_crypto/api/dio_client.dart';
import 'package:client_crypto/models/asset_model.dart';
import 'package:client_crypto/ui/widgets/actions/actions_bar.dart';
import 'package:client_crypto/ui/widgets/wall_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  final DioClient _dioClient = DioClient();
  late Future<List<Asset>> _listOfAllAssets;

  @override
  void initState() {
    _listOfAllAssets = _dioClient.getAllAsstes();
    super.initState();
  }

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
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _listOfAllAssets = _dioClient.getAllAsstes();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: themeData.primaryColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                FeatherIcons.refreshCcw,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.5.h),
                          child: Text(
                            "Refresh Assets",
                            style: GoogleFonts.poppins(
                              color: themeData.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                actionsWidget(themeData),
                FutureBuilder(
                  future: _listOfAllAssets,
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