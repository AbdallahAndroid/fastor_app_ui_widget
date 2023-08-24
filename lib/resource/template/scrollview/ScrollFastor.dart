import 'dart:ui';



import 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollSpeed.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/language/DirectionLanguage.dart';
import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';



class ScrollFastor extends StatelessWidget  {

  Widget child;
  BuildContext? context;
  ScrollController? scrollController;
  double? toolbarHeight;
  double? footer_height;
  Color? effectScrollbarColor;
  bool? isStopScroll;
  bool? thumbVisibility;

  ScrollFastor({
    required this.child,
    this.scrollController,
    this.toolbarHeight,
    this.footer_height,
    this.effectScrollbarColor,
    this.isStopScroll,
    this.thumbVisibility
  });

  @override
  Widget build(BuildContext context) {
    this.context = context;

    //default
    toolbarHeight ??= 0;
    footer_height ??= 0;


    // var statusBarHeight = StatusBarConstant.getHeight();
    // Log.i( "statusHeight : " + statusHeight.toString() );

    // fix toolbar + navigation
    var tallView = Column( children: [
      // EmptyView.empty( statusBarHeight   , statusBarHeight   ),
      EmptyView.empty( toolbarHeight!   , toolbarHeight!  ),

      EmptyView.empty( footer_height!  , footer_height!   )
    ]);

    //validate not need
    var scroll ;
    if( DeviceTools.isBrowserIOS() ) {
      scroll =  _caseScrollMobileBrowser(   );
    } else if ( DeviceTools.isPlatformWeb() ) {
      scroll =  _caseScrollNormal(  );
    } else {
      scroll =  _caseScrollNormal( );
    }

    return scroll;
  }


  //------------------------------------------------------------- cases

  Widget _caseScrollMobileBrowser(  ){

    //  physics:   NeverScrollableScrollPhysics() ,

    //speed
    /**
        //why 4 ?
        because iphone or  android in browser the speed of scroll is slow
     */
    ScrollSpeed scrollSpeed = ScrollSpeed(context!, speed: 4);

    //scroll
    var scroll =  _caseScrollNormal(  );

    //super
    return  GestureDetector(
      behavior: HitTestBehavior.translucent,
      child:  scroll,
      onVerticalDragUpdate: (  details) {
        //   Log.i( "gestureDetectorListener() - onVerticalDragUpdate - details: " + details.toString()  );
        scrollSpeed.updateTouchContinue(details);

        //hide keyboard while touch
        FocusScope.of(context!).unfocus();
      } ,
      onTap: (){
        //  Log.i( "getTouchSuper() - onTap # "    );

        //hide keyboard when click on space
        FocusScope.of(context!).unfocus();
      },

    );
  }

    Widget _caseScrollNormal(  ) {

    //setup isStopScroll
    ScrollPhysics physicsValue = AlwaysScrollableScrollPhysics()  ;

    //scroll
    var scrollChild = SingleChildScrollView(
      controller: scrollController ,
      physics: physicsValue,
      child: child, //tallView,
      //keyboard when scrolling
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      reverse: DirectionLanguage.SingleChildScrollView_reverseStatus_vertical(context!),
    );

    //thumbVisibility
    var scrollBar = null;
    thumbVisibility ??= false;
    var isNotWeb = DeviceTools.isPlatformWeb() == false;
    if( thumbVisibility! && isNotWeb ) {
      scrollBar = Scrollbar(
        child: scrollChild,
        // isAlwaysShown: true,  //removed from flutter sdk 3.13.1
        trackVisibility: true,
      );
    } else {
      scrollBar = scrollChild;
    }


    //make touch working on web
    var scrollConfig =  ScrollConfiguration(
      behavior: ScrollConfiguration.of( context! ).copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      child: scrollBar,
    );

    var expanded =  Expanded(child: scrollConfig);

    return Column(
        children : [

          expanded
        ]
    );
  }

}

