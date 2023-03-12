import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:vidyutrenz_app/constants/colors.dart';

class Analogclock extends StatefulWidget {
  const Analogclock({Key? key}) : super(key: key);

  @override
  State<Analogclock> createState() => _AnalogclockState();
}

class _AnalogclockState extends State<Analogclock> {
  @override
  Widget build(BuildContext context) {
    return AnalogClock(
      tickColor: colors.lightColor,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            'assets/logo.png',
          ),
        ),
      ),
      height: 100,
      width: MediaQuery.of(context).size.width * 0.2,
      isLive: true,
      hourHandColor: Colors.white,
      minuteHandColor: Colors.white,
      secondHandColor: Colors.red,
      showSecondHand: true,
      numberColor: Colors.white,
      showNumbers: true,
      textScaleFactor: 2,
      showTicks: true,
      showDigitalClock: false,
      datetime: DateTime.now(),
    );
  }
}
