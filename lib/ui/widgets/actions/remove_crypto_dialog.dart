import 'package:client_crypto/api/dio_client.dart';
import 'package:client_crypto/models/asset_model.dart';
import 'package:client_crypto/ui/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

RxString errorMsg = ''.obs;
Future<void> displayRemoveCryptoDialog(
    String assetId,
    ThemeData themeData) async {
  errorMsg.value = '';
  List<String> cryptoList = ['No Cryptocurrency to remove'];
  RxString selectedValue = 'No Cryptocurrency to remove'.obs;

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
          Text("Sei sicuro di voler rimuovere $assetId?"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents vertically,
              children: [
                ElevatedButton(
                onPressed: () async {
                  Asset deletedAsset = await DioClient().deleteAssetById(assetId: assetId);
                  print("Asset Eliminato: " + deletedAsset.toString());
                  Get.back();
                },
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
                  onPressed: () {
                    Get.back();
                  },
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
