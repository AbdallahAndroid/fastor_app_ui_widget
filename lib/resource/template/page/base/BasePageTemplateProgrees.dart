import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:fastor_app_ui_widget/resource/template/progressView/ProgressPage.dart';

class BasePageTemplateProgress {

  //----------------------------------------------------------------------- circle pr


  static Widget progressView(ValueChanged<ProgressCircleState>? changeState){

    //check mobile need progress
    if (changeState == null ) {
      return EmptyView.zero();
    }

    //circle
    return ProgressCircle(changeState);
  }


}