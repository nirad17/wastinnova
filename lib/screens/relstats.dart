import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
class RelStats extends StatefulWidget {
  const RelStats({ Key? key }) : super(key: key);

  @override
  State<RelStats> createState() => _RelStatsState();
}

class _RelStatsState extends State<RelStats> {
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
          ChartTitle(text: 'Your contribution in Waste - 2021 \n (in Kgs)'),
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
      WasteData('You', 529),
      WasteData('Your Locality', 9240),
    ];
    return chartData;
  }
}


class WasteData {
  WasteData(this.Type, this.kgs);
  final String Type;
  final int kgs;
}