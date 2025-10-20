

import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:flutter/material.dart';


class ProgressCircleApp extends StatelessWidget {

  Color? color;
  double? size;


  ProgressCircleApp( {
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    var prg = CircularProgressIndicator( color: color??AppColor.progress);

    //container
    var ct = Container(
        width: size??40,
        height: size??40,
        child: prg,
        alignment: Alignment.center
    );

    return Container(
      child:  ct,
      alignment: Alignment.center,
    );

  }


}