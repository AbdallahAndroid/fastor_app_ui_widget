
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/customWidget/select/DropdownApp.dart';
import 'package:fastor_app_ui_widget/customWidget/select/widget/PreviousSelected.dart';
import 'package:flutter/material.dart';

extension ProgressDropdown on DropdownAppState {

  Widget progressWidget(){
    // return  progressCircle();
    return Container(
      width: widget.width,
      height: widget.height_frame,
      decoration: widget.decorationProgressView??widget.decorationOutlineDropdown,
      // child: _stackTextAndProgressIcon(),
      child: progressIcon(),
      alignment: Alignment.center,
    );
  }


  Widget progressIcon(){
    var prog = ProgressCircleApp(size: widget.sizeProgress, color: widget.colorProgress);
    return SizedBox( width: widget.sizeProgress! * 2, child: prog );
  }


}