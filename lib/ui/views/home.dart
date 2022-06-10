import 'package:client_crypto/application/viewmodel.dart';
import 'package:client_crypto/data/asset_dto.dart';
import 'package:client_crypto/ui/widgets/actions/actions_bar.dart';
import 'package:client_crypto/ui/widgets/wall_chart_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//import 'package:client_crypto/domain/entities/asset_icon.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  late ViewModel _viewModel;

  @override
  void initState() {
    //_viewModel = ref.read(viewModelProvider.notifier);
    _viewModel.retreiveAsset();
    super.initState();
  }

  /*final DioClient dioClient = DioClient();
  List<AssetIcon>? assetIconList;*/

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);
    return Material(
      child: Consumer(
        builder:(context, ref, builder) {
          final viewModel = ref.watch(viewModelProvider);

          return viewModel.when(
            data: (data) {
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
                          ? 'assets/logo_light_theme.jpg'
                          : 'assets/logo_dark_theme.jpg',
                      height: 10.5.h,
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
                        wallChartWidget(themeData),
                      ],
                    ),
                  ),
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (err, stack) {
              return Center(
                child: Text(
                  err.toString(),
                ),
              );
            },
          );
        }
      ),
    );
  }
  
}