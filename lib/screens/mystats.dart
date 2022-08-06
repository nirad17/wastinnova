import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MyStats extends StatefulWidget {
  @override
  State<MyStats> createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {
  late List<WasteData> _chartData;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(
      title:
          ChartTitle(text: 'Type wise Waste - 2021 \n (in Kgs)'),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<WasteData, String>(
            dataSource: _chartData,
            xValueMapper: (WasteData data, _) => data.Type,
            yValueMapper: (WasteData data, _) => data.kgs,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
           )
      ],
    ));
  }

  List<WasteData> getChartData() {
    final List<WasteData> chartData = [
      WasteData('Wet', 160),
      WasteData('Dry', 249),
      WasteData('Others', 120),
    ];
    return chartData;
  }
}


class WasteData {
  WasteData(this.Type, this.kgs);
  final String Type;
  final int kgs;
}