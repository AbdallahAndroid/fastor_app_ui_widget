import 'dart:async';

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';

/**
    ----------------------------- how to use

    0- declare at instance scope
    final ScrollController _scrollController = ScrollController();

    1- at  widget onBuild() {
    _setupOnScrollComplete();
    }



    2-  declare
    void _setupOnScrollComplete() {
      ScrollOnCompleteController(
          scrollController: _scrollController,
          isLoadingNextPage: isLoadingNextPage,
          onCompleteCallback: (){
            onScrollArriveBottomAndValidToGetNextPageChange();
          }
    );
    }




 */

typedef OnCompleteScrollingCallback = Function( );

class ScrollOnCompleteController {

  /// variable
  Timer? _debounceTimer;
  int _lastEdition = 0;

  /// parameter constructor
  ScrollController scrollController  ;
  bool isLoadingNextPage;
  OnCompleteScrollingCallback  onCompleteCallback;

  ScrollOnCompleteController(  {
    required this.scrollController,
    required this.isLoadingNextPage,
    required this.onCompleteCallback}) {

    _lastEdition = _getCurrentTimestamp();
    _setupOnScrollListener();
  }

  ///---------------------------------------------------------- setup scroll

  void _setupOnScrollListener() {
    scrollController.addListener( (){
      bool isArriveMaxBottom = scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100 ;
      if (  isArriveMaxBottom     ) {
        if(   ! isLoadingNextPage ) {
          //Log.i("ScrollOnCompleteController - _setupOnScrollListener() - isArriveMaxBottom");
          _onArriveBottom();
        }
      }
    });

  }


  _onArriveBottom(){
    int timeTrigger = _getCurrentTimestamp();
    _timerAgain(  timeTrigger );
  }


  _timerAgain(  int timeTrigger){
    _lastEdition = _getCurrentTimestamp();
    // Cancel the previous timer if it's still active
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    // Set up a new timer that triggers after 1000 milliseconds
    _debounceTimer = Timer(Duration(milliseconds: 1000), () {
      bool thereInNoEdition  = timeTrigger == _lastEdition;
      if (thereInNoEdition) {
        Log.i("ScrollOnCompleteController - _timerAgain() - thereInNoEdition _lastEdition: $_lastEdition");
        onCompleteCallback();
      }
    });
  }


  int _getCurrentTimestamp() {
    // int numberWith1000 =  new DateTime.now().millisecondsSinceEpoch;
    var dateUtc = DateTime.now().toUtc();
    int numberWith1000 = dateUtc.millisecondsSinceEpoch;
    String num_str = numberWith1000.toString();
    int len = num_str.length;
    String cut1000 = num_str.substring(0, len - 3);
    return int.parse(cut1000);
  }


}