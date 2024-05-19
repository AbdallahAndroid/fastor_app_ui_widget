// License BSD 3
// Copyright (c) 2022, Abdallah Mahmoud Ahmed Shehata
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice,
// this list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
// * Neither the name of fastor-app.com nor the names of its contributors
// may be used to endorse or promote products derived from this software
// without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

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
class ScrollSpeedAbdallah {

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


  ScrollSpeedAbdallah (this.context,{
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