import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MoistureChart extends StatefulWidget {
  @override
  _MoistureChartState createState() => _MoistureChartState();
}

class _MoistureChartState extends State<MoistureChart> {
  List<charts.Series<MoistureData, DateTime>> _seriesMoisturechart;
  _generateChart() {
    var moistureData = [
      new MoistureData(
          new DateTime.now().subtract(
            Duration(hours: 3),
          ),
          10),
      new MoistureData(
          new DateTime.now().subtract(
            Duration(hours: 2),
          ),
          20),
      new MoistureData(
          new DateTime.now().subtract(
            Duration(hours: 1),
          ),
          30),
      new MoistureData(new DateTime.now(), 40),
      new MoistureData(
          new DateTime.now().add(
            Duration(hours: 1),
          ),
          50),
      new MoistureData(
          new DateTime.now().add(
            Duration(hours: 2),
          ),
          60),
      new MoistureData(
          new DateTime.now().add(
            Duration(hours: 3),
          ),
          10),
    ];

    _seriesMoisturechart.add(charts.Series(
      id: 'Moist',
      colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff999ff9)),
      data: moistureData,
      domainFn: (MoistureData moisturedata, _) => moisturedata.time,
      measureFn: (MoistureData moisturedata, _) => moisturedata.MoistureValue,
    )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesMoisturechart = List<charts.Series<MoistureData, DateTime>>();
    _generateChart();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Moisture Chart',
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
                _seriesMoisturechart,
                defaultRenderer: new charts.LineRendererConfig(
                    includeArea: true, stacked: true),
                behaviors: [
                  new charts.ChartTitle('Time',
                      behaviorPosition: charts.BehaviorPosition.bottom,
                      titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
                  new charts.ChartTitle('Moisture',
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

//Container class
class MoistureData {
  double MoistureValue;
  DateTime time;

  MoistureData(this.time, this.MoistureValue);
}
