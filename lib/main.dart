import 'package:flutter/material.dart';


import 'clock.dart';

void main() => runApp(DigitalClockApp());

class DigitalClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DigitalClock(), debugShowCheckedModeBanner: false);
  }
}