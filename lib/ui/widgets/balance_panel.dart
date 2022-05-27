import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'crypto_icon.dart';
import 'profit_percentage.dart';
import 'package:sizer/sizer.dart';




Center balancePanel(
    double balance, double profit, double profitPercent, ThemeData themeData) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        color: themeData.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 90.w,
      height: 22.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Balance',
                      style: GoogleFonts.lato(
                        color: themeData.primaryColor.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      width: 55.w,
                      child: Text(
                        '\$${balance.toStringAsFixed(2).replaceFirst('.', ',').replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.')}',
                        style: GoogleFonts.poppins(
                          color: themeData.primaryColor,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: Row(
                    children: [
                      // TODO: replace CryptoFontIcons with response icon from API
                      /*cryptoIcon(CryptoFontIcons.ETH, themeData),
                      cryptoIcon(CryptoFontIcons.BTC, themeData),*/
                      cryptoIcon(Icons.favorite, themeData),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profit',
                      style: GoogleFonts.lato(
                        color: themeData.primaryColor.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.2.h),
                      child: Text(
                        '\$${profit.toStringAsFixed(2).replaceFirst('.', ',').replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.')}',
                        style: GoogleFonts.poppins(
                          color: themeData.primaryColor.withOpacity(0.9),
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                profitPercentageWidget(profitPercent),
              ],
            )
          ],
        ),
      ),
    ),
  );
}