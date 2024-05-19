

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressSpinFastor extends StatelessWidget {

  Color? color;
  double? size;


  ProgressSpinFastor( {
    required this.color,
    required this.size
  }){
    /**
     * the spin libriry not working when size less than 28
     */
    if(size! < 30 ) {
      size = 30;
    }
  }


  @override
  Widget build(BuildContext context) {
    var c2 = color!.withOpacity( 0.5);

    final spinkit = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? color : c2,
          ),
        );
      },
    );

    var sizeBox = SizedBox( child: spinkit, width: size, height:  size ,);

    return Container(
      child:  sizeBox,
      alignment: Alignment.center,
    );

  }


}