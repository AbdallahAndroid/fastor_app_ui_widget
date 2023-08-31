import 'dart:ui';


import 'package:fastor_app_ui_widget/resource/uiFastor/language/DirectionLanguage.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/statusBar/StatusBarConstant.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';

import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';



class SingleChildScrollViewTemplate {


  /**
   * "t" symbole for "template" means choose the axis
   */
  static Widget t(BuildContext context, Axis axis, List<Widget> children, double minesMargin) {
    if( axis == Axis.horizontal ) {
      return SingleChildScrollViewTemplate.hList( context, children );
    } else {
      return SingleChildScrollViewTemplate.vList( context, children, minesMargin );
    }
  }

  /**
   * horizontal
   */
  static Widget h( BuildContext context,  Widget child ){
    return SingleChildScrollView(
        reverse: DirectionLanguage.SingleChildScrollView_reverseStatus_horizontal( context ),
        scrollDirection: Axis.horizontal,
        child: child
    );
  }

  //----------------------------------------------------------------------- horizontal

  /**
   * horizontal list
   */
  static Widget hList( BuildContext context, List<Widget> children  ){
    //Log.i( "hList()  ");

    //fix backend sort
    var sortListByLang = DirectionLanguage.row_nestedScrollHorizontal_arrayWidget(context, children)  ;

    //row
    var row = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: sortListByLang,
    );

    //scroll
    var scroll = SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: DirectionLanguage.SingleChildScrollView_reverseStatus_horizontal(context),
        scrollDirection: Axis.horizontal,
        child: row
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

    //fix aligement be in start forever with size match-parent
    //  i need to be in center with wrapcontent
    return Container( child:  scrollConfig , );
  }

  //----------------------------------------------------------------- vertical

  /**
   * vertical
   */
  static Widget vList( BuildContext context, List<Widget> children,
      double minesMarginVertical ){
    //Log.i( "vList()");

    // list
    var columnAsListView = Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);


    //scroll
    var scroll = SingleChildScrollView(
      child: columnAsListView,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    );

    //make touch working on web
    var scrollConfig =  ScrollConfiguration(
      behavior: ScrollConfiguration.of( context ).copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown,
          PointerDeviceKind.invertedStylus
        },
      ),
      child: scroll,
    );

    //shadow
    var effectScrollbar  = DSColor.ds_background_all_screen;
    var themeScroll = Theme(
      //Inherit the current Theme and override only the accentColor property
        data: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: effectScrollbar),
        ),
        child: scrollConfig
    );

    //cal height
    double statusHeight = StatusBarConstant.getHeight(context);
    double maxHeight = DeviceTools.getHeight(context)  - minesMarginVertical - statusHeight;


    //expanded
    var box = BoxConstraints(maxHeight:  maxHeight);
    var boxExpanded = ConstrainedBox(
        constraints: box,
        child:  themeScroll );

    return boxExpanded;
  }



}