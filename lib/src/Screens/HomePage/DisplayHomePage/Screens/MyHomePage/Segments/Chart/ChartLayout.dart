import 'dart:async';

import 'package:flutter/material.dart';

import 'chartDirectory/EachChartDescriptionPage/TemperatureChart.dart';
import 'chartDirectory/EachChartDescriptionPage/TempChartDescriptivePage.dart';
import 'chartDirectory/HumidityChart.dart';
import 'chartDirectory/MoistureChart.dart';
import 'chartDirectory/pHChart.dart';

class ChartLayout extends StatefulWidget {
  @override
  _ChartLayoutState createState() => _ChartLayoutState();
}

class _ChartLayoutState extends State<ChartLayout> {
  PageController pageController = new PageController(initialPage: 0);

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          //  physics: AlwaysScrollableScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TempChartDescriptivePage()),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TemperatureChart(),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: MoistureChart()),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: HumidityChart()),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: PhChart()),
          ],
        ));
  }
}
