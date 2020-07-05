import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({this.container, this.appbarText});

  // List list;
  final String appbarText;
  final Container container;
//  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: container,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey[200],
            ],
          ),
        ),
      ),
    );
  }
}
