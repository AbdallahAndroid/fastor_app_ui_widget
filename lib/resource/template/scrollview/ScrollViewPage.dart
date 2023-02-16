import 'dart:ui';

 

import 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollSpeed.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/language/DirectionLanguage.dart';
import 'package:flutter/material.dart';
 
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
 
 

class ScrollViewPage {

  static Widget t( BuildContext context,     Widget pageContent,
      {
        ScrollController? scrollController,
     double? toolbarHeight,
        double? footer_height,
        Color? effectScrollbar,
      }) {

    //default
    toolbarHeight ??= 0;
    footer_height ??= 0;


    // var statusBarHeight = StatusBarConstant.getHeight();
   // Log.i( "statusHeight : " + statusHeight.toString() );

    // fix toolbar + navigation
    var tallView = Column( children: [
      // EmptyView.empty( statusBarHeight   , statusBarHeight   ),
      EmptyView.empty( toolbarHeight   , toolbarHeight  ),
      pageContent,
      EmptyView.empty( footer_height  , footer_height   )
    ]);

    //validate not need
    var scroll ;
    if( DeviceTools.isBrowserIOS() ) {
      scroll = ScrollViewPage._caseScrollMobileBrowser(  context, tallView, effectScrollbar);
    } else {
      scroll = ScrollViewPage._caseScrollNormal( context, tallView, scrollController, effectScrollbar, false );
    }

    return scroll;
  }


  //------------------------------------------------------------- cases

  static  Widget _caseScrollMobileBrowser(BuildContext context, Widget child,  Color? effectScrollbar){

  //  physics:   NeverScrollableScrollPhysics() ,

    //speed
    /**
        //why 4 ?
          because iphone or  android in browser the speed of scroll is slow
     */
    ScrollSpeed scrollSpeed = ScrollSpeed(context, speed: 4);

    //scroll
    var scroll = ScrollViewPage._caseScrollNormal( context,
        child,
        scrollSpeed.getScrollController(),
        effectScrollbar, true );

    //super
    return  GestureDetector(
      behavior: HitTestBehavior.translucent,
      child:  scroll,
      onVerticalDragUpdate: (  details) {
        //   Log.i( "gestureDetectorListener() - onVerticalDragUpdate - details: " + details.toString()  );
        scrollSpeed.updateTouchContinue(details);

        //hide keyboard while touch
        FocusScope.of(context).unfocus();
      } ,
      onTap: (){
        //  Log.i( "getTouchSuper() - onTap # "    );

        //hide keyboard when click on space
        FocusScope.of(context).unfocus();
      },

    );
  }

  static Widget _caseScrollNormal(BuildContext context, Widget child,
      ScrollController? scrollController, Color? effectScrollbar , bool isStopScroll ) {


    ScrollPhysics physicsValue = AlwaysScrollableScrollPhysics()  ;
    if( isStopScroll  ) {
      physicsValue = NeverScrollableScrollPhysics();
    }

    //scroll
    var scroll = SingleChildScrollView(
      controller: scrollController,
      physics: physicsValue,
      child: child, //tallView,
      //keyboard when scrolling
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      reverse: DirectionLanguage.SingleChildScrollView_reverseStatus_vertical(context),
    );


    //make touch working on web
    var scrollConfig =  ScrollConfiguration(
      behavior: ScrollConfiguration.of( context ).copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      child: scroll,
    );

    //shadow
    effectScrollbar ??= DSColor.ds_background_all_screen;
    var theme = Theme(
      //Inherit the current Theme and override only the accentColor property
        data: ThemeData(
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: effectScrollbar),
        ),
        child: scrollConfig);


    var expanded =  Expanded(child: theme);

    return Column(
        children : [

          expanded
        ]
    );
  }

}
