library count_down_timer;

import 'dart:async';
import 'package:flutter/material.dart';

import 'countdown.dart';

///CountDownText : A simple text widget that display the countdown timer
///based on the dateTime given e.g DateTime.utc(2050)
class CountDownText extends StatefulWidget {
  CountDownText(
      {Key? key,
      required this.due,
      required this.finishedText,
      this.longDateName = false,
      this.style,
      this.showLabel = false,
      this.daysTextLong = " Gün ",
      this.hoursTextLong = " Saat ",
      this.minutesTextLong = " Dakika ",
      this.secondsTextLong = " Saniye ",
      this.daysTextShort = " g ",
      this.hoursTextShort = " s ",
      this.minutesTextShort = " d ",
      this.secondsTextShort = " s ",})
      : super(key: key);

  final DateTime? due;
  final String? finishedText;
  final bool? longDateName;
  final bool? showLabel;
  final TextStyle? style;
  final String daysTextLong;
  final String hoursTextLong;
  final String minutesTextLong;
  final String secondsTextLong;
  final String daysTextShort;
  final String hoursTextShort;
  final String minutesTextShort;
  final String secondsTextShort;

  @override
  _CountDownTextState createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      CountDown().timeLeft(widget.due!,
          widget.finishedText!,
          widget.daysTextLong,
          widget.hoursTextLong,
          widget.minutesTextLong,
          widget.secondsTextLong,
          widget.daysTextShort,
          widget.hoursTextShort,
          widget.minutesTextShort,
          widget.secondsTextShort,
          longDateName: widget.longDateName, showLabel: widget.showLabel),
      style: widget.style,
    );
  }
}
