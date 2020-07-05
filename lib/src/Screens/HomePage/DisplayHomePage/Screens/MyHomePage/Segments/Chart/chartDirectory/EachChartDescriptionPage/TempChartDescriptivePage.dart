import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import '../EachChartDescriptionPage/TempChartDescriptivePage.dart';
import 'dart:ui';
import 'TemperatureChart.dart';

class TempChartDescriptivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Temperature Chart"),
          centerTitle: true,
          flexibleSpace: kAppBarContainer,
        ),
        body: Column(
          // scrollDirection: Axis.vertical,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    child: TemperatureChart(),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Card(
                      color: Colors.pink[100],
                      elevation: 5,
                      child: Container(
                        height: 40,
                        width: 40,
                        // color: Colors.grey,
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(right: 2),
                        child: Icon(
                          Icons.filter_list,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  "Field Description",
                  style: kTabBarProfileText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
