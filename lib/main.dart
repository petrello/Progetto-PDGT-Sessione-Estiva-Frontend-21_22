import 'package:client_crypto/ui/theme/theme.dart';
import 'package:client_crypto/ui/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500),
        title: 'PDGT App',
        home: const Home(),
        theme: lightModeTheme,
        darkTheme: darkModeTheme,
      );
    });
  }
}