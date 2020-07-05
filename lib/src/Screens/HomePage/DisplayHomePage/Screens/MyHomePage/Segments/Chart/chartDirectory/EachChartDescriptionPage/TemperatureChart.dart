import 'dart:async';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TemperatureChart extends StatefulWidget {
  @override
  _TemperatureChartState createState() => _TemperatureChartState();
}

class _TemperatureChartState extends State<TemperatureChart> {
  List<charts.Series<Temp, DateTime>> _seriesTempChart;
  _generateChart() {
    var tempData = [
      new Temp(20, new DateTime.now()),
      new Temp(
        30,
        new DateTime.now().add(
          Duration(hours: 1),
        ),
      ),
      new Temp(
        40,
        new DateTime.now().add(
          Duration(hours: 2),
        ),
      ),
    ];

    _seriesTempChart.add(
      charts.Series(
        id: 'Temp',
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        domainFn: (Temp tempdata, _) => tempdata.time,
        measureFn: (Temp tempdata, _) => tempdata.tempvalue,
        data: tempData,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesTempChart = List<charts.Series<Temp, DateTime>>();
    _generateChart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Temperature Chart',
              style: TextStyle(
                // decoration: TextDecoration.underline,
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
                    
                    _seriesTempChart,
                    animate: true,
                    animationDuration: Duration(milliseconds: 300),
                    defaultRenderer: new charts.LineRendererConfig(
                        includeArea: true, stacked: true),
                    behaviors: [
                      new charts.ChartTitle('Time',
                          behaviorPosition: charts.BehaviorPosition.bottom,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                      new charts.ChartTitle('Temperature',
                          behaviorPosition: charts.BehaviorPosition.start,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                          ],
                          selectionModels: [
                            
                          ],

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Temp {
  double tempvalue;
  DateTime time;
  Temp(this.tempvalue, this.time);
}
