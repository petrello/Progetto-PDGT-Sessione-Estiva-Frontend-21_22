import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import './action_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Padding actionsWidget(ThemeData themeData) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 1.0.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        actionWidget(FeatherIcons.plus, 'Add a new Asset', themeData),
        //actionWidget(FeatherIcons.dollarSign, 'Topup', themeData),
        //actionWidget(FeatherIcons.upload, 'Withdraw', themeData),
      ],
    ),
  );
}
