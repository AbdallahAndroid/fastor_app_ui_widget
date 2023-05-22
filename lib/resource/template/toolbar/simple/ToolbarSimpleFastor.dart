
import 'package:easy_localization/src/public_ext.dart';


import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';


class ToolbarSimpleFastor extends StatefulWidget {

  String myTitle;
  bool hideBackButton = false;
  ValueChanged<bool>? onClickListener;

  //icon
  Color? iconColorBack;
  double? iconSize;

  static const frameHeight = 60.0;
  Widget? buttonLeft;
  Widget? buttonRight;
  BuildContext pageContext;

  ToolbarSimpleFastor(
      this.pageContext, this.myTitle ,{
        ValueChanged<bool>? this.onClickListener,
        bool hideBackButton = false,
        Widget? buttonLeft,
        Widget? buttonRight,
        this.iconSize,
        this.iconColorBack
      } ) {
    //set values
    this.hideBackButton = hideBackButton;
    this.buttonLeft = buttonLeft;
    this.buttonRight = buttonRight;

    iconColorBack ??= Colors.grey;
    iconSize ??= 20;

    //translate
    this.myTitle = myTitle.tr();
    //  Log.i( "ToolbarSimple - myTitle: $myTitle /onClickListener: $onClickListener");
  }


  @override
  _ToolbarSimple createState()  {
    return  _ToolbarSimple(pageContext, myTitle, onClickListener:onClickListener, hideBackButton:  hideBackButton );
  }


}

class _ToolbarSimple extends  State<ToolbarSimpleFastor>   {

  String myTitle;
  bool  hideBackButton = false;
  ValueChanged<bool>? onClickListener;
  BuildContext pageContext;

  _ToolbarSimple(this.pageContext, this.myTitle ,{
    ValueChanged<bool>? this.onClickListener,
    bool hideBackButton = false
  } ) {
    this.hideBackButton = hideBackButton;
    //  Log.i( "ToolbarSimple - myTitle: $myTitle /onClickListener: $onClickListener");
  }

  //--------------------------------------------------------------------------- build stacks

  @override
  Widget build(BuildContext context) {
    //Log.i( "ToolbarSimple - build()");

    return Container(
      alignment: Alignment.topCenter,
      child:  content(),
    );

  }

  Widget content(){
    return Stack( children: [

      EmptyView.colored( DeviceTools.getWidth( context), ToolbarSimpleFastor.frameHeight, DSColor.ds_background_toolbar),

      //title
      Positioned( child:  tv_title(), left: 0, right: 0 , top: 6 ),


      //back
      Positioned( child:  bt_back(), left: 0,   top: 0  ),

      //button left
      Positioned(child: bt_left() , left: 0, top: 0 , bottom: 0 ),

      //button right
      Positioned(child: bt_right() , right: 0, top: 0 , bottom: 0 ),


    ],);
  }


  //---------------------------------------------------------------------------- title

  Widget tv_title(){
    var txt =  Text( myTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: DSDimen.text_level_1,
            color: DSColor.toolbar_title,
            decoration:  TextDecoration.none
        )
    );

    return Container( child:  txt ,
        margin: EdgeInsets.only(top: 15)
    );

  }

  //---------------------------------------------------------------------------- back button

  Widget bt_back() {
    //check hide
    if( hideBackButton ) {
      return EmptyView.zero();
    }

    //show
    var icon = Icon( Icons.arrow_back ,size: widget.iconSize, color: widget.iconColorBack, );
    var ct = Container(
      // width: icon_size,
        height: ToolbarSimpleFastor.frameHeight ,
        alignment: Alignment.center,
        // margin: EdgeInsets.only( top: 15 ),
        padding: EdgeInsets.only( left: DSDimen.space_parent),
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
    if ( onClickListener != null) {
      //   Log.i( "onClickListener needed");
      onClickListener!(true);
      return;
    }

    //finish class
    Navigator.pop( pageContext  );
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