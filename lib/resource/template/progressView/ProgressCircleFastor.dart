

import 'package:flutter/material.dart';


class ProgressCircleFastor extends StatelessWidget {

  Color? color;
  double? size;


  ProgressCircleFastor( {
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
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