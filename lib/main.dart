import 'package:flutter/material.dart';
import 'package:wastinnova/screens/connect.dart';
import 'package:wastinnova/screens/dumpwaste.dart';
import 'package:wastinnova/screens/home.dart';
import 'package:wastinnova/screens/statistics.dart';
import 'package:wastinnova/screens/track.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wastinnova',
      theme: ThemeData(
        // primarySwatch: Color(0xFF37B943),
        appBarTheme: AppBarTheme(color:  Color(0xFF37B943)),
      ),
      initialRoute: 'home',
      routes: {
        'home':(context) =>Home(),
        'tracking':(context)=>TrackingVan(),
        'stats':(context)=>StatsScreen(),
        'dumpwaste':(connect) =>DumpWaste(),
        'connect':(context)=>ConnectScreen(),
        },
    );
  }
}