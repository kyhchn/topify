import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:topify/assets/colors.dart';
import 'package:topify/views/dashboard.dart';
import 'package:topify/views/loginpage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: pastelBrown),
        fontFamily: 'Gotham',
        canvasColor: pastelCream,
        backgroundColor: pastelGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: pastelBrown,
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
