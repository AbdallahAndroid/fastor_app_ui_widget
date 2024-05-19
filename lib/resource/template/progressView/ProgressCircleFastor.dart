
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:flutter/material.dart';


class ProgressCircleFastor extends StatelessWidget {

  Color? color;
  double? size;


  ProgressCircleFastor( {
    this.color,
    this.size
  }){
    color ??= DSColor.ds_progress;
    size ??= 40.0;

  }


  @override
  Widget build(BuildContext context) {
    var colorAlpha = color!.withOpacity( 0.5);

    var prg = CircularProgressIndicator( color: color);

    //container
    var ct = Container(
        width: size,
        height: size,
        child: prg,
        alignment: Alignment.center
    );

    return Container(
      child:  ct,
      alignment: Alignment.center,
    );

  }


}