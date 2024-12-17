//
import 'dart:async';


import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/timer/timer_second/TimerLogic.dart';
import 'package:flutter/material.dart';


typedef TimerEndCallBack = Function();

class TimerCountDownApp extends StatefulWidget {

  BuildContext contextPage;
  int second;
  TimerEndCallBack callBack;
  bool? isModeHiddenJustTimer ;

  Color? color;
  String? fontFamily;
  double? fontSize;

  TimerCountDownApp( {
    required this.contextPage,
    required this.second,
    required this.callBack,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.isModeHiddenJustTimer = false,
  });


  @override
  TimerFastorState createState() => TimerFastorState(second);
}

class TimerFastorState extends State<TimerCountDownApp> {


  int secondRemaining = 0 ;
  String  mm_ss_shape = "";
  Timer? myTimer;

  TimerFastorState( this.secondRemaining);


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
        child:  TextApp( mm_ss_shape,
          color: widget.color,
          fontFamily: widget.fontFamily,
          fontSize: widget.fontSize??15,
        )
    );
  }



}