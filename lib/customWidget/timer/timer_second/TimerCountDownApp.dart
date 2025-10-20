//
import 'dart:async';


import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/timer/timer_second/core/TimerLogic.dart';
import 'package:flutter/material.dart';


typedef TimerEndCallBack = Function();
typedef TimerStartCallback = Function();
enum TimerWorkingMode{ onInitState, onTap }

class TimerCountDownApp extends StatefulWidget {

  BuildContext contextPage;
  int second;
  TimerEndCallBack callBackEnd;
  TimerStartCallback callbackOnStart;
  TimerWorkingMode timerWorkingMode;

  /// make action after some second without timer showing in ui
  bool? isModeHiddenJustTimer ;

  Color? color;
  String? fontFamily;
  String? prefixSecondText;
  String? hintText;
  double? fontSize;

  TimerCountDownApp( {
    required this.contextPage,
    required this.second,
    required this.timerWorkingMode,
    required this.callbackOnStart,
    required this.callBackEnd,
    this.color,
    this.hintText,
    this.prefixSecondText,
    this.fontSize,
    this.fontFamily,
    this.isModeHiddenJustTimer = false,
  });


  @override
  TimerCountState createState() => TimerCountState(second);
}

class TimerCountState extends State<TimerCountDownApp> {


  int secondRemaining = 0 ;
  String  mm_ss_shape = "";
  Timer? myTimer;
  bool isTimerEnd = false;

  TimerCountState( this.secondRemaining);


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.timerWorkingMode == TimerWorkingMode.onInitState  ) await intervalTimerStart();
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
    //
    return GestureDetector(
      onTap: ()async{
        bool isModeOnTap = widget.timerWorkingMode == TimerWorkingMode.onTap;
        bool isTimerStoped = myTimer == null ||( myTimer!.isActive == false) ;
        if( isModeOnTap && isTimerStoped ) {
          await intervalTimerStart();
        }
      },
      child: chooseShape(),
    );
  }


  Widget chooseShape(){

    /// case hide forever
    if(widget.isModeHiddenJustTimer!) {
      return SizedBox();
    }

    /// when found hint text
    ///case timer end,
    ///case timer not start yet
    bool isEndTimerAndFoundHintText = isTimerEnd && widget.prefixSecondText != null;
    bool isNotStartTimerYetAndFoundHintText = (myTimer == null ) && widget.prefixSecondText != null;
    if( isEndTimerAndFoundHintText || isNotStartTimerYetAndFoundHintText ) {
      return hintText();
    }

    /// case timer working now
    return shapeSecondTimerInProgress();
  }

  Widget shapeSecondTimerInProgress() {
    String secondText = "";
    String prefix = widget.prefixSecondText??"";
    bool isStillFoundSecond = mm_ss_shape.isNotEmpty;
    if( isStillFoundSecond) {
      secondText = mm_ss_shape + " " + prefix;
    } else {
      secondText = mm_ss_shape;
    }
    return   Container(
        child:  TextApp( secondText,
          color: widget.color,
          fontFamily: widget.fontFamily,
          fontSize: widget.fontSize??15,
        )
    );;
  }


  Widget hintText() {
    return TextApp( widget.hintText??"",
      color: widget.color,
      fontFamily: widget.fontFamily,
      fontSize: widget.fontSize??15,
    );
  }



}