import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() => runApp(DigitalClockApp());

class DigitalClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DigitalClock(), debugShowCheckedModeBanner: false);
  }
}

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late String _timeString;
  late String _dateString;
  late String _dayString;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final timeFormat = DateFormat('hh:mm:ss a');
    final dateFormat = DateFormat('MMMM dd yyyy');
    final dayFormat = DateFormat('EEEE');

    setState(() {
      _timeString = timeFormat.format(now);
      _dateString = dateFormat.format(now);
      _dayString = dayFormat.format(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  TextStyle get _textStyle => TextStyle(
    color: Colors.white,
    fontSize: 48,
    fontFamily: 'Times New Roman',
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_timeString, style: _textStyle),
            Text(_dateString, style: _textStyle.copyWith(fontSize: 24)),
            Text(_dayString, style: _textStyle.copyWith(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
