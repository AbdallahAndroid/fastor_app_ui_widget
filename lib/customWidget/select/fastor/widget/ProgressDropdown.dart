
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleFastor.dart';
import 'package:fastor_app_ui_widget/customWidget/select/fastor/DropdownFastor.dart';
import 'package:fastor_app_ui_widget/customWidget/select/fastor/widget/PreviousSelected.dart';
import 'package:flutter/material.dart';

extension ProgressDropdown on DropdownFastorState {

  Widget progressWidget(){
    // return  progressCircle();
    return Container(
      width: widget.width,
      height: widget.height_frame,
      decoration: widget.decorationOutlineDropdown,
      // child: _stackTextAndProgressIcon(),
      child: progressIcon(),
      alignment: Alignment.center,
    );
  }


  Widget progressIcon(){
    var prog = ProgressCircleFastor(size: widget.sizeProgress, color: widget.colorProgress);
    return SizedBox( width: widget.sizeProgress! * 2, child: prog );
  }


}