

import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/size/NotchBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/core/size/StatusBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/simple/TitleAppBar.dart';
import 'package:fastor_app_ui_widget/customWidget/emptyView/EmptyView.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppBarSimple extends StatefulWidget {

  //title
  String title;
  Color? titleColor;
  EdgeInsets? titleMargin;

  bool hideBackButton = false;
  ValueChanged<bool>? onClickListener;

  //icon
  Color? iconColor;
  double? iconSize;

  static double frameHeight = Figma.h(64);
  Widget? buttonLeft;
  Widget? buttonRight;
  BuildContext pageContext;
  Color? colorBackgroundToolbar;

  AppBarSimple(
      this.pageContext, this.title ,{
        ValueChanged<bool>? this.onClickListener,
        bool hideBackButton = false,
        this.buttonLeft,
        this.buttonRight,
        this.titleColor,
        this.titleMargin,
        this.iconSize,
        this.iconColor,
        this.colorBackgroundToolbar
      } ) {
    //set values
    this.hideBackButton = hideBackButton;
    this.buttonLeft = buttonLeft;
    this.buttonRight = buttonRight;

    iconColor ??= Colors.white;
    iconSize ??= Figma.h( 20 );

    //toolbar
    titleColor ??= Colors.white;
    colorBackgroundToolbar ??= statusBarColorBackgroundBlackSecond;
  }


  @override
  _AppBarSimpleState createState()  {
    return  _AppBarSimpleState(  );
  }


}

class _AppBarSimpleState extends  State<AppBarSimple>   {


  double paddingBackButtonVertical = Figma.h(10);

  //--------------------------------------------------------------------------- build stacks

  @override
  Widget build(BuildContext context) {
    paddingBackButtonVertical = Figma.h(10);
    //Log.i( "ToolbarSimple - build()");
    return getDirection();
  }


  Widget getDirection() {
    return   Directionality(
      textDirection:   LangApp.getTextDirection(),
      child: contentUIUnderNotchHeight(),
    );
  }


  Widget contentUIUnderNotchHeight(){
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top:  NotchBarSizeHelper.getTop( widget.pageContext)),
      color: widget.colorBackgroundToolbar,
      height:  AppBarSimple.frameHeight + NotchBarSizeHelper.getTop(context) ,
      child:  stackContent(),
    );
  }

  Widget stackContent(){
    return Stack( children: [

      EmptyView.colored( DeviceTools.getWidth( context),
          AppBarSimple.frameHeight,
          widget.colorBackgroundToolbar!
      ),

      //title
      Positioned( child:  tv_title(), left: Figma.w(24 + 5), right: Figma.w(24 + 5) , top: Figma.h(20 )  ),

      //back
      PositionedApp.langApp( child:  bt_back(), left: 0,   top: Figma.h(20 - (paddingBackButtonVertical / 2 )  )   ),

      //button left
      PositionedApp.langApp(child: bt_left() , left: 1, top: Figma.h(20 )   ),

      //button right
      PositionedApp.langApp(child: bt_right() , right: 1, top: Figma.h(20 )   ),


    ],);
  }


  // double notchTop(){  return NotchBarSizeHelper.getTop(context) ;}
  //---------------------------------------------------------------------------- title

  Widget tv_title(){
    return TitleAppBar( widget.title );
  }

  //---------------------------------------------------------------------------- back button

  Widget bt_back() {
    //check hide
    if( widget.hideBackButton ) {
      return EmptyView.zero();
    }

    //show
    var icon = Icon( CupertinoIcons.back,
        size: Figma.h(24),
        color: widget.iconColor
    );

    var ct = Container(
        color: Colors.transparent,
        // height: AppBarSimple.frameHeight ,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: paddingBackButtonVertical /2),
        child: icon
    );

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