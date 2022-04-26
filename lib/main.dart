import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:topify/views/loginpage.dart';
import 'package:topify/views/toptracks.dart';
import 'package:topify/views/userprofile.dart';
Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Gotham',
        canvasColor: Colors.pink.shade50,
        backgroundColor: Colors.pink.shade100,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.red,
      ),
      home: Scaffold(

        body: LoginPage(),
      ),
    );
  }
}