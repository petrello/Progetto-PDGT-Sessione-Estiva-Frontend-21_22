import 'package:client_crypto/ui/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

RxString errorMsg = ''.obs;
Future<void> displayRemoveCryptoDialog(
    //Function() forceRefresh,
    String cryptoName,
    ThemeData themeData) async {
  errorMsg.value = '';
  List<String> cryptoList = ['No Cryptocurrency to remove'];
  RxString selectedValue = 'No Cryptocurrency to remove'.obs;
  //Box portfolioBox = await Hive.openBox('portfolio');

  /*if (portfolioBox.isNotEmpty) {
    cryptoList = [portfolioBox.keys.first];
    selectedValue.value = portfolioBox.keys.first;
  }
  for (var i = 1; i < portfolioBox.length; i++) {
    cryptoList.add(portfolioBox.keyAt(i));
  }*/

  TextEditingController ammountController = TextEditingController();
  return Get.defaultDialog(
    title: 'Remove Cryptocurrency',
    backgroundColor: themeData.backgroundColor,
    titlePadding: const EdgeInsets.only(top: 8.0),
    radius: 20.0,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically
        children: [
          Text("Sei sicuro di voler rimuovere $cryptoName?"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents vertically,
              children: [
                ElevatedButton(
                onPressed: () {},
                child: Text("SI", style: GoogleFonts.lato(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    letterSpacing: 1
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(themeData.primaryColor)
                 ),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("NO", style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      letterSpacing: 1
                  ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(themeData.secondaryHeaderColor)
                  ),
                )
              ],
          ),
          ),
        ],
      ),
    ),
  );
}

/*
Future removeCrypto(
    Function() forceRefresh, String crypto, String value) async {
  if (value.isNotEmpty) {
    Box portfolioBox = await Hive.openBox('portfolio');

    double storedValue = portfolioBox.get(crypto);
    if (storedValue - double.parse(value) < 0) {
      errorMsg.value = "You can't remove more than you have (\$$storedValue)";
    } else {
      if (storedValue - double.parse(value) == 0) {
        portfolioBox.delete(crypto);
        forceRefresh();
        Get.back();
      } else {
        portfolioBox.put(
          crypto,
          storedValue - double.parse(value),
        );
        forceRefresh();
        Get.back();
      }
    }
  } else {
    errorMsg.value = "Type ammount to remove!";
  }
}*/
