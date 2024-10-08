//
import 'dart:async';



import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/timer/timer_days/logic/TimerLogic.dart';
import 'package:flutter/material.dart';


typedef TimerEndCallBack = Function();

class TimerDaysWidget extends StatefulWidget {

  BuildContext contextPage;
  int second;
  TimerEndCallBack callBack;
  bool? isModeHiddenJustTimer ;

  Color? color;
  String? fontFamily;
  double? fontSize;

  TimerDaysWidget( {
    required this.contextPage,
    required this.second,
    required this.callBack,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.isModeHiddenJustTimer = false,
  });


  @override
  TimerDaysState createState() => TimerDaysState(second);
}

class TimerDaysState extends State<TimerDaysWidget> {


  int secondRemaining = 0 ;
  String  dayRemaing = "";
  String  hourRemaing = "";
  String  minRemaing = "";
  String  secondRemaing = "";
  Timer? myTimer;

  TimerDaysState( this.secondRemaining);


  @override
  void initState() {
    super.initState();
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
        child:  TextApp( dayRemaing + " Day " + hourRemaing + " Hour " + minRemaing + " Min " + secondRemaing + " Second",
          color: Colors.black,
          fontFamily: widget.fontFamily,
          fontSize: widget.fontSize??15,
        )
    );
  }



}