

import 'dart:async';

import 'package:fastor_app_ui_widget/resource/ds/LevelDS.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
import 'package:log_debug/log_debug.dart';


import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/template/container/ContainerTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';

class ProgressCircle extends StatefulWidget {

  ValueChanged<ProgressCircleState> changeState;
  Color? color;
  EdgeInsets? margin;

  ProgressCircle(this.changeState, {
    Color? color,
    EdgeInsets? margin}) {
    this.color = color;
    this.margin = margin;
  }


  @override
  ProgressCircleState createState() {
    // TODO: implement createState
    var state = ProgressCircleState(margin: margin, color: color);
    changeState(state);
    return state;
  }

}

class ProgressCircleState extends State<ProgressCircle> {

  //---------------------------------------------------------------------- variable

  var _progressActive = false;

  var _msg_error = "";


  Color? color;
  EdgeInsets? margin;

  ProgressCircleState( {
    Color? color,
    EdgeInsets? margin}) {
    this.color = color;
    this.margin = margin;
  }


//---------------------------------------------------------------------- public

  void show(){

    setState(() {
      _msg_error =  "";
      _progressActive = true;
    });
  }


  void dismiss({String?  error, ValueChanged<bool>? dismissComplete}){

    //change data
    _msg_error = error ??"";
    _progressActive = false;
    setState(() {
    });


    //wait for ram to fix progrss stop animate
    Timer(Duration(milliseconds: 1), () {
      if(dismissComplete != null ) dismissComplete(true);
    });
  }

  bool isVisible() {
    return _progressActive;
  }

  //---------------------------------------------------------------------- build


  @override
  Widget build(BuildContext context) {
     return _chooseVisibility();
  }

  //---------------------------------------------------------------------- view

  Widget _chooseVisibility(){
   // Log.i( "_chooseVisibility() - _msg_error: $_msg_error" );
    if( _progressActive ) {
      return _getProgressWidget();
    } else if( _isValid(_msg_error ) ) {
      return _txt_message_error();
    } else {
      return EmptyView.zero();
    }
  }

  Widget _txt_message_error(){
    LogDebug.i( "_txt_message_error() - _msg_error: $_msg_error" );
    return TextTemplate.t( _msg_error, levelDS: LevelDS.l2, color: DSColor.ds_error);
  }

  Widget _getProgressWidget() {

    //default color
    color ??= DSColor.ds_progress;

    var prg = CircularProgressIndicator( color: color);

    return ContainerTemplate.fixedWidth(
        prg, 40,
        margin,
        null, null, Alignment.center
    );
  }

  static bool _isValid(String? str)
  {
    if (str == null) {
      return false;
    }
    if (str.length == 0) {
      return false;
    }
    if (str == "") {
      return false;
    }
    if (str == "null") {
      return false;
    }
    if ("null" == str.trim().toLowerCase()) {
      return false;
    }
    if (str == " ") {
      return false;
    }
    return true;
  }

}