import 'dart:async';

import 'package:fastor_app_ui_widget/customWidget/timer/timer_second/TimerCountDownApp.dart';

extension TimerLogic on TimerFastorState {

  //------------------------------------------------------------ timer

  Future intervalTimerCreate() async {


    //fire now
    _fireTimerAction();

    //wait some second then fire
    myTimer = Timer.periodic(const Duration(milliseconds: 1000 ), (_) {
      _fireTimerAction();
    });
  }


  Future _fireTimerAction() async {

    //increment
    secondRemaining = secondRemaining - 1;
    // Log.i("_fireTimerAction() - loop secondRemaining: " + secondRemaining.toString()  );

    //validate to stop on zero view
    bool isEndTimer = secondRemaining == 0;
    if( isEndTimer  ) {
      _resetTimerAndEmitEndTimerState();
      stopTimer();
      updateUIWithNewTimerValue();
      return;
    }
    bool isHideWhenNegative = secondRemaining < 0;
    if( isHideWhenNegative) {
      stopTimer();
      return;
    }

    //ui
    updateUIWithNewTimerValue();
  }

  Future _resetTimerAndEmitEndTimerState() async {
    // Log.i("resetTimerAndEmitEndTimerState()   "   );
    stopTimer();
    hideTimerUI();
    callBackTheTimerEnd();
  }

  stopTimer() {
    if( myTimer == null )return false;
    myTimer?.cancel();
  }



  //--------------------------------------------------------------- ui update

  void updateUIWithNewTimerValue() {
    if(isViewMounted() == false ) return;

    setState(() {
      mm_ss_shape =  formatSecondsToMinutesAndSeconds( secondRemaining );
    });
  }

  void hideTimerUI(){
    if(isViewMounted() == false ) return;
    setState(() {
      mm_ss_shape =  "";
    });
  }

  bool isViewMounted(){
    if( context.mounted == false ) return false ;
    if( widget.contextPage.mounted == false ) return false ;
    return true;
  }

  //--------------------------------------------------------------- call back

  void callBackTheTimerEnd(){
    // Log.i("callBackTheTimerEnd() - sec: $secondRemaining");
    widget.callBack();
  }

  //-------------------------------------------------------------------- time

  /**
      int totalSeconds = 125;
      String formattedTime = formatSecondsToMinutesAndSeconds(totalSeconds);
      print(formattedTime); // Output: 02:05
   */
  String formatSecondsToMinutesAndSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }


}