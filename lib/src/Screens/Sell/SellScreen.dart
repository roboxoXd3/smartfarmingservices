import 'package:flutter/material.dart';
import 'SellScreenLayout.dart';

class SellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
      Container(
        margin: EdgeInsets.only(bottom: 8),
        height: 600,
      child: SellScreenLayout(),
    ),
      ]
    );
  }
}
