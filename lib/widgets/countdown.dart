import 'package:date_count_down/date_count_down.dart';
import 'package:vidyutrenz_app/colors.dart';
import 'package:flutter/material.dart';

import 'clock.dart';

class countdown extends StatefulWidget {
  final Size size;
  const countdown({Key? key, required this.size}) : super(key: key);

  @override
  State<countdown> createState() => _countdownState();
}

class _countdownState extends State<countdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: widget.size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colors.containerColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(4, 4), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 12, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'COUNTDOWN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Countdown to our Vidytrenz event',
              style: TextStyle(
                color: colors.lightColor,
                fontSize: 12,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: CountDownText(
                      due: DateTime.utc(2023, 03, 23),
                      finishedText: "00 : 00 : 00 : 00",
                      showLabel: true,
                      longDateName: true,
                      daysTextLong: " : ",
                      hoursTextLong: " : ",
                      minutesTextLong: " : ",
                      secondsTextLong: "",
                      style: TextStyle(
                        overflow: TextOverflow.fade,
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Analogclock(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
