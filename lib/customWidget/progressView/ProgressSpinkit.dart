


import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/emptyView/EmptyView.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class ProgressSpinkit {


  static Widget centerPage(BuildContext context, {    required Color   progressFade1, required Color  progressFade2}  ) {
    var stack = Stack(children: [
      EmptyView.empty(   DeviceTools.getWidth(context), DeviceTools.getHalfHeight(context)  ),
      Positioned(child:  ProgressSpinkit.get(progressFade1: progressFade1, progressFade2: progressFade2  ), left: 0, right: 0, top: DeviceTools.getHalfHeight(context)-50 )
    ],);

    return stack;
  }


  static Widget get(  { required Color   progressFade1, required Color  progressFade2} ) {


    final spinkit = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ?progressFade1 : progressFade2,
          ),
        );
      },
    );

    return spinkit;
  }

  static Widget getFixedSize(    {  required double size, required Color   progressFade1, required Color  progressFade2}  ){
    var prg = ProgressSpinkit.get(  progressFade1: progressFade1, progressFade2: progressFade2 );

    var sizeBox = SizedBox( child: prg, width: size, height:  size ,);

    return Container( child:  sizeBox,
      alignment: Alignment.center,
    );
  }


}