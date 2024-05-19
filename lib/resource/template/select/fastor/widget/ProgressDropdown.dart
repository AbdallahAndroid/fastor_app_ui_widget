
import 'package:fastor_app_ui_widget/resource/template/select/fastor/widget/PreviousSelected.dart';
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


  // Widget _stackTextAndProgressIcon(){
  //   double marginTopIcon = widget.iconSize  / 4;
  //
  //   return Stack( children: [
  //     SizedBox(width: widget.width, height: widget.height_frame),
  //
  //     /// icon
  //     PositionedFastor.directional(
  //       textDirection:  widget.textDirection!,
  //       child: progressIcon(),
  //       top: marginTopIcon,
  //       start: 0  ,
  //     ),
  //
  //     /// content
  //     chooseHintOrPreviousSelectedTextWidget(),
  //   ],);
  // }

  Widget progressIcon(){
    var prog = ProgressCircleFastor(size: widget.sizeProgress, color: widget.colorProgress);
    return SizedBox( width: widget.sizeProgress! * 2, child: prog );
  }


}