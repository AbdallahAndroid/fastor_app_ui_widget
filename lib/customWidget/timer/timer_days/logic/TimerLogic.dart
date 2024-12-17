import 'dart:async';

import 'package:fastor_app_ui_widget/customWidget/timer/timer_days/TimerDaysWidget.dart';

extension TimerLogic on TimerDaysState {

  //------------------------------------------------------------ timer

  Future intervalTimerCreate() async {


    //fire now
    _fireTimerAction();

    //wait some second then fire
    myTimer = Timer.periodic(const Duration(milliseconds: 500 ), (_) {
      _fireTimerAction();
    });
  }


  Future _fireTimerAction() async {

    //dif
    final currentTime = DateTime.now();
    remainingTime = expiryDateStartDateTime.difference(currentTime);
    // expireRemaingDateTime = TimeTools.getDateTimeMinesSecondPassingDate( expireRemaingDateTime, 1  ) ;
    // secondRemaining = TimeTools.convertDateToSecondBetweenNowAndThisDate( expireRemaingDateTime.toString());
    // Log.i("_fireTimerAction() - loop remainingTime: " + remainingTime.toString() );

    //validate to stop on zero view
    bool isEndTimer = remainingTime.isNegative;
    if( isEndTimer  ) {
      _resetTimerAndEmitEndTimerState();
      stopTimer();
      updateUIWithNewTimerValue();
      return;
    }
    // bool isHideWhenNegative = secondRemaining < 0;
    // if( isHideWhenNegative) {
    //   stopTimer();
    //   return;
    // }

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
      dayRemaing = remainingTime.inDays.toString();
      hourRemaing = remainingTime.inHours.remainder(24).toString();
      minRemaing = remainingTime.inMinutes.remainder(60).toString();
      secondRemaingUntillToday = remainingTime.inSeconds.remainder(60).toString();
    });
  }

  void hideTimerUI(){
    if(isViewMounted() == false ) return;
    setState(() {
      dayRemaing =  "";
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

// /**
//     int totalSeconds = 125;
//     String formattedTime = formatSecondsToMinutesAndSeconds(totalSeconds);
//     print(formattedTime); // Output: 02:05
//  */
// String formatSecondsToMinutesAndSeconds(int seconds) {
//   int minutes = seconds ~/ 60;
//   int remainingSeconds = seconds % 60;
//
//   String minutesStr = minutes.toString().padLeft(2, '0');
//   String secondsStr = remainingSeconds.toString().padLeft(2, '0');
//
//   return '$minutesStr:$secondsStr';
// }


}