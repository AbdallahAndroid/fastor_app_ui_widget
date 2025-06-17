// ignore_for_file: must_be_immutable
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:flutter/material.dart';


class ProgressCircleContainer extends StatelessWidget {
  Color? color;
  double? size;
  EdgeInsets? margin;

  ProgressCircleContainer({this.color, this.size, this.margin}) {
    color ??= ColorResource.progress;
    size ??= 40.0;
  }

  @override
  Widget build(BuildContext context) {
    var prg = CircularProgressIndicator(color: color);

    //nav_container
    var ct = Container(
        width: size, height: size, child: prg, alignment: Alignment.center);

    return Container(
      width: DeviceTools.getWidth(context),
      child: ct,
      margin: margin,
      alignment: Alignment.center,
    );
  }
}
