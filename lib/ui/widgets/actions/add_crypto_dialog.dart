
import 'package:client_crypto/api/dio_client.dart';
import 'package:client_crypto/models/asset_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> displayAddCryptoDialog(
    String selectedValueDefault,
    ThemeData themeData) async {

  final myController = TextEditingController();

  return Get.defaultDialog(
    title: 'Add a new Asset',
    backgroundColor: themeData.backgroundColor,
    titlePadding: const EdgeInsets.only(top: 8.0),
    radius: 20.0,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: themeData.backgroundColor,
                border: Border.all(
                  color: themeData.primaryColor,
                ),
              ),
              width: 70.w,
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(
                  border:  InputBorder.none,
                  hintText: 'BTC, ETH ...',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Center(
              child: InkWell(
                onTap: () async {
                  Asset addedAsset = await DioClient().addNewAsset(assetId: myController.text);
                  print("ADDED ASSET: " + addedAsset.toString());
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: themeData.primaryColor,
                    ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Add Cryptocurrency',
                      style: TextStyle(
                      color: themeData.backgroundColor,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    ),
  );
}
