import 'dart:async';


import 'package:flutter/material.dart';


/// how to use "ScrollSpeed"
/// 1- at initState():
///
///   @override
///   void initState() {
///     super.initState();
///
///     scrollSpeed = ScrollSpeed(context, speed: 4,
///         speedForMobileBrowserOnly: false );
///   }
///
/// 2- at   view :
///       //  content
///       SingleChildScrollView(
///         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
///         controller: scrollSpeed!.getScrollController(),       //here line
///         physics:   NeverScrollableScrollPhysics() ,
///         child:  getColumnTemplate(),
///         // child: getColumnTemplateTestLoop(),
///       ),
class ScrollSpeed {

  final String tag = "ScrollSpeed";
  BuildContext context;
  double speed;
  // bool  speedForMobileBrowserOnly = true ;
  ScrollController scrollController = ScrollController();


  //offset
  double totalOffset_oneWay = 0;
  double animateJumpTime = 0;

  //touch valid
  bool touchEnd = false;
  final constantTimeToWaitForTouch = 8;
  final minPixelToTakeAction = 6;

  //log for testing
  static double totalHistory = 0;
  static List<int> historyLog = [];


  ScrollSpeed (this.context,{
    required this.speed,
    // bool? speedForMobileBrowserOnly = true
  }  ){
    // this.speedForMobileBrowserOnly = speedForMobileBrowserOnly;

    /**
     * must every speed increase, to increase also animation time
     *   to avoid UX bug that scroll jump without animate
     */
    this.animateJumpTime = speed * 100;
  }

  ScrollController getScrollController() {

    return scrollController;
  }


  //------------------------------------------------------------------- touch event

  int counterEvent = 0;

  Future updateTouchContinue(DragUpdateDetails details) async {

    //increment
    counterEvent = counterEvent + 1 ;

    //get info
    final start  = details.delta.dx;
    final end  = details.delta.dy;
    final howManyPixelScrollByUser =   start- end ;
    final pixelAfterSpeedResult = howManyPixelScrollByUser * speed;

    // Log.k( tag, "updateTouchContinue() - howManyPixelScrollByUser: " + howManyPixelScrollByUser.toString()
    //     + " / before totalOffset_oneWay: " + totalOffset_oneWay.toString()  );


    //set total
    totalOffset_oneWay += pixelAfterSpeedResult;

    //check touch end
    await _checkTouchEnd( counterEvent);

  }

  //---------------------------------------------------------------- checker touch end

  Future _checkTouchEnd(int currentCounter) async {

    //timer to check
    Future.delayed(Duration(milliseconds: constantTimeToWaitForTouch), () {

      //check
      touchEnd = counterEvent == currentCounter;

      //log
      //  Log.k( tag,  "_checkTouchEnd() - touchEnd: " + touchEnd.toString()   + " /counterEvent: " + counterEvent.toString()
      //      + " /currentCounter: " + currentCounter.toString() );

      //check touch end
      if( touchEnd  ) {

        _jumpCalculate();
      }


    });
  }

  //------------------------------------------------------------------------ jump

  Future _jumpCalculate() async {

    //prevent again
    touchEnd = false;

    //info
    double max = scrollController.position.maxScrollExtent;

    //log
    // Log.k( tag, "_jumpNow() - max: " + max.toString()   );
    // Log.k( tag, "_jumpNow() - currentOffSet: " + currentOffSet.toString()   );

    // // choose direction
    double newOffSet =     totalOffset_oneWay;
    //
    //check min and max
    if(   newOffSet >= max   ) {
      newOffSet = max;

      //initlzize again'
      totalOffset_oneWay = max;

    } else if( newOffSet <= 0 ) {
      newOffSet = 0;

      //initlzize again'
      totalOffset_oneWay = 0;
    }
    // Log.k( tag, "_jumpNow() - totalOffSetChange: " + totalOffset_oneWay.toString()
    //     + " /newOffSet: " + newOffSet.toString()  + " /max: " + max.toString()   );

    //jump
    await _jumpToThisPoint( newOffSet );

    //log
    int num =  newOffSet.toInt();
    historyLog.add( num );
    totalHistory += newOffSet;
  }


  Future _jumpToThisPoint(double point )  async {

    //without animate
    /**
        scrollController.jumpTo( point );
     */

    //animate
    scrollController.position.animateTo(
      point,
      duration:   Duration(milliseconds: animateJumpTime.toInt() ),
      curve: Curves.easeInOut,
    );

  }


}