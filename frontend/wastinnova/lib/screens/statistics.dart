import 'package:flutter/material.dart';
import 'package:wastinnova/screens/mystats.dart';
import 'package:wastinnova/screens/relstats.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({ Key? key }) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                indicatorColor: Colors.white,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: "My Stats",),
              Tab(text: "Relative Stats",),
            ]),

            ],
          ),
          ),
        body:  TabBarView(
          children: [
            MyStats(),
            RelStats(),
          ],)
      ),
    );
  }
}