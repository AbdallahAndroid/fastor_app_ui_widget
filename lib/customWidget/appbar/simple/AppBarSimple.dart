

import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/customWidget/emptyView/EmptyView.dart';
import 'package:flutter/material.dart';

class AppBarSimple extends StatefulWidget {

  //title
  String title;
  Color? titleColor;
  EdgeInsets? titleMargin;

  bool hideBackButton = false;
  ValueChanged<bool>? onClickListener;

  //icon
  Color? iconColorBack;
  double? iconSize;

  static const frameHeight = 60.0;
  Widget? buttonLeft;
  Widget? buttonRight;
  BuildContext pageContext;
  Color? colorBackgroundToolbar;

  AppBarSimple(
      this.pageContext, this.title ,{
        ValueChanged<bool>? this.onClickListener,
        bool hideBackButton = false,
        Widget? buttonLeft,
        Widget? buttonRight,
        this.titleColor,
        this.titleMargin,
        this.iconSize,
        this.iconColorBack,
        this.colorBackgroundToolbar
      } ) {
    //set values
    this.hideBackButton = hideBackButton;
    this.buttonLeft = buttonLeft;
    this.buttonRight = buttonRight;

    iconColorBack ??= Colors.grey;
    iconSize ??= 20;

    //  Log.i( "ToolbarSimple - myTitle: $myTitle /onClickListener: $onClickListener");

    //toolbar
    titleColor ??= Colors.white;
    colorBackgroundToolbar ??= Colors.black;
  }


  @override
  _ToolbarSimple createState()  {
    return  _ToolbarSimple(  );
  }


}

class _ToolbarSimple extends  State<AppBarSimple>   {


  //--------------------------------------------------------------------------- build stacks

  @override
  Widget build(BuildContext context) {
    //Log.i( "ToolbarSimple - build()");
    return getDirection();
  }


  Widget getDirection() {
    return   Directionality(
      textDirection:   LangApp.getTextDirection(),
      child:   Builder(
        builder: (BuildContext context) {
          return   MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: contentUI(),
          );
        },
      ),
    );
  }


  Widget contentUI(){
    return Container(
      alignment: Alignment.topCenter,
      child:  stackContent(),
    );
  }

  Widget stackContent(){
    return Stack( children: [

      EmptyView.colored( DeviceTools.getWidth( context),
          AppBarSimple.frameHeight, widget.colorBackgroundToolbar!),

      //title
      Positioned( child:  tv_title(), left: 0, right: 0 , top: 0 ),


      //back
      PositionedApp.langFastor( child:  bt_back(), left: 0,   top: 0  ),

      //button left
      PositionedApp.langFastor(child: bt_left() , left: 0, top: 0 , bottom: 0 ),

      //button right
      PositionedApp.langFastor(child: bt_right() , right: 0, top: 0 , bottom: 0 ),


    ],);
  }


  //---------------------------------------------------------------------------- title

  Widget tv_title(){
    var txt =  Text( widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
            color: widget.titleColor,
            decoration:  TextDecoration.none
        )
    );

    return Container( child:  txt ,
        margin: widget.titleMargin?? EdgeInsets.only(top: 15)
    );

  }

  //---------------------------------------------------------------------------- back button

  Widget bt_back() {
    //check hide
    if( widget.hideBackButton ) {
      return EmptyView.zero();
    }

    //show
    var icon = Icon( Icons.arrow_back ,size: widget.iconSize, color: widget.iconColorBack, );
    var ct = Container(
      // width: icon_size,
        height: AppBarSimple.frameHeight ,
        alignment: Alignment.center,
        // margin: EdgeInsets.only( top: 15 ),
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        child: icon);

    return GestureDetector( child: ct ,
      onTap: () {
        backClick();
      },
    );
  }

  void backClick() {

    // Log.i( "backClick()");
    //check found customer listener
    if ( widget.onClickListener != null) {
      //   Log.i( "onClickListener needed");
      widget.onClickListener!(true);
      return;
    }

    //finish class
    Navigator.pop( widget.pageContext  );
  }

  //---------------------------------------------------------------------- button left/right

  Widget bt_left(){
    if( widget.buttonLeft != null ) {
      return widget.buttonLeft!;
    } else {
      return EmptyView.zero();
    }
  }


  Widget bt_right(){
    if( widget.buttonRight != null ) {
      return widget.buttonRight!;
    } else {
      return EmptyView.zero();
    }
  }



}