
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class ProgressSpinkit {


  static Widget centerPage(BuildContext context ) {
    var stack = Stack(children: [
      EmptyView.empty(   DeviceTools.getWidth(context), DeviceTools.getHalfHeight(context)  ),
      Positioned(child:  ProgressSpinkit.get( ), left: 0, right: 0, top: DeviceTools.getHalfHeight(context)-50 )
    ],);

    return stack;
  }


  static Widget get(  ) {

    HexColor c1 =  DSColor.ds_progress_fade_1;
    HexColor c2 =  DSColor.ds_progress_fade_2 ;

    final spinkit = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ?c1 : c2,
          ),
        );
      },
    );

    return spinkit;
  }

  static Widget getFixedSize(   double size){
    var prg = ProgressSpinkit.get(   );

    var sizeBox = SizedBox( child: prg, width: size, height:  size ,);

    return Container( child:  sizeBox,
      alignment: Alignment.center,
    );
  }


}