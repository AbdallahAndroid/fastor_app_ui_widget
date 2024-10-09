//
import 'dart:async';



import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/timer/timer_days/logic/TimerLogic.dart';
import 'package:flutter/material.dart';


typedef TimerEndCallBack = Function();

class TimerDaysWidget extends StatefulWidget {

  BuildContext contextPage;
  String expiryDateStartString; // example "2025-12-31T00:00:00.000000Z"
  TimerEndCallBack callBack;
  bool? isModeHiddenJustTimer ;

  Color? color;
  String? fontFamily;
  double? fontSize;

  TimerDaysWidget( {
    required this.contextPage,
    required this.expiryDateStartString,
    required this.callBack,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.isModeHiddenJustTimer = false,
  });


  @override
  TimerDaysState createState() => TimerDaysState(expiryDateStartString);
}

class TimerDaysState extends State<TimerDaysWidget> {


  String expiryDateStartString;
  DateTime expiryDateStartDateTime =  DateTime.now();
  Duration remainingTime = Duration();
  // int secondRemaining = 0;

  String  dayRemaing = "";
  String  hourRemaing = "";
  String  minRemaing = "";
  String  secondRemaingUntillToday = "";
  Timer? myTimer;

  TimerDaysState( this.expiryDateStartString);


  @override
  void initState() {
    super.initState();
    expiryDateStartDateTime = DateTime.parse( expiryDateStartString );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await intervalTimerCreate();
    });
  }


  @override
  void dispose() {
    super.dispose();
    // Log.i( "TimerChatState - dispose()");
    stopTimer();
  }


  @override
  Widget build(BuildContext context) {
    // Log.i("TimerChatState - build() - isModeHiddenJustTimer: " + widget.isModeHiddenJustTimer.toString()  );
    if(widget.isModeHiddenJustTimer!) {
      return SizedBox();
    }
    return   Container(
        child:  TextApp( dayRemaing + " Day " + hourRemaing + " Hour " + minRemaing + " Min " + secondRemaingUntillToday + " Second",
          color: Colors.black,
          fontFamily: widget.fontFamily,
          fontSize: widget.fontSize??15,
        )
    );
  }



}