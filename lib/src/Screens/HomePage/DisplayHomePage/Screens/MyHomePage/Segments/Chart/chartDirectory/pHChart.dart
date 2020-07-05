import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PhChart extends StatefulWidget {
  @override
  _PhChartState createState() => _PhChartState();
}

class _PhChartState extends State<PhChart> {
  List<charts.Series<pH, DateTime>> _seriespHChart;
  _generateChart() {
    var pHData = [
      new pH(
          new DateTime.now().subtract(
            Duration(hours: 3),
          ),
          10),
      new pH(
          new DateTime.now().subtract(
            Duration(hours: 2),
          ),
          20),
      new pH(
          new DateTime.now().subtract(
            Duration(hours: 1),
          ),
          30),
      new pH(new DateTime.now(), 40),
      new pH(
          new DateTime.now().add(
            Duration(hours: 1),
          ),
          50),
      new pH(
          new DateTime.now().add(
            Duration(hours: 2),
          ),
          60),
      new pH(
          new DateTime.now().add(
            Duration(hours: 3),
          ),
          70),
    ];

    _seriespHChart.add(
      charts.Series(
        id: 'pH',
        data: pHData,
        domainFn: (pH pHdata, _) => pHdata.time,
        measureFn: (pH pHdata, _) => pHdata.pHvalue,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriespHChart = List<charts.Series<pH, DateTime>>();
    _generateChart();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'pH Chart',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Varela',
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              margin: EdgeInsets.all(24.0),
              child: charts.TimeSeriesChart(
                _seriespHChart,
                defaultRenderer: new charts.LineRendererConfig(
                    includeArea: true, stacked: true),
                behaviors: [
                  new charts.ChartTitle('Time',
                      behaviorPosition: charts.BehaviorPosition.bottom,
                      titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                  new charts.ChartTitle('pH',
                      behaviorPosition: charts.BehaviorPosition.start,
                      titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class pH {
  double pHvalue;
  DateTime time;

  pH(this.time, this.pHvalue);
}
