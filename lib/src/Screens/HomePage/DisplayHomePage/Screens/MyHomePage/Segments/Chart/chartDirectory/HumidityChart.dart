
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HumidityChart extends StatefulWidget {
  @override
  _HumidityChartState createState() => _HumidityChartState();
}

class _HumidityChartState extends State<HumidityChart> {
  List<charts.Series<Humidity, DateTime>> _seriesHumidityChart;
  _generateChart() {
    var humidity = [
      new Humidity(
          new DateTime.now().subtract(
            Duration(hours: 3),
          ),
          10),
      new Humidity(
          new DateTime.now().subtract(
            Duration(hours: 2),
          ),
          20),
      new Humidity(
          new DateTime.now().subtract(
            Duration(hours: 1),
          ),
          30),
      new Humidity(new DateTime.now(), 20),
      new Humidity(
          new DateTime.now().add(
            Duration(hours: 1),
          ),
          40),
      new Humidity(
          new DateTime.now().add(
            Duration(hours: 2),
          ),
          50),

//      new Humidity(new DateTime.now(), 20),

      new Humidity(
          new DateTime.now().add(
            Duration(hours: 3),
          ),
          60),
    ];

    _seriesHumidityChart.add(
      charts.Series(
        id: 'Temp',
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff99ff99)),
        domainFn: (Humidity humiditydata, _) => humiditydata.time,
        measureFn: (Humidity humiditydata, _) => humiditydata.humidityValue,
        data: humidity,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesHumidityChart = List<charts.Series<Humidity, DateTime>>();
    _generateChart();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Humidity Chart',
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
                _seriesHumidityChart,
                defaultRenderer: new charts.LineRendererConfig(
                    includeArea: true, stacked: true),
                behaviors: [
                  new charts.ChartTitle('Time',
                      behaviorPosition: charts.BehaviorPosition.bottom,
                      titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                  new charts.ChartTitle('Humidity',
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

class Humidity {
  double humidityValue;
  DateTime time;

  Humidity(this.time, this.humidityValue);
}
