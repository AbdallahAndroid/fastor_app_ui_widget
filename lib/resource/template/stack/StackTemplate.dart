
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:flutter/material.dart';

@Deprecated( "Under Testing")
class StackTemplate {

  //------------------------------------------------------------------------------ two item

  static Widget child1AlignLeft_child2CenterHorizontal(Widget child1, Widget child2,{
    double child1_marginLeft = 0,
    double child1_marginTop = 0,
    double child2_marginTop = 0
  } ) {
    var stack = Stack(
      children: [

        //back
        Positioned(child: child1 ,
            left: child1_marginLeft,  top: child1_marginTop),

        // title
        Positioned(child: child2 , left: 0, right: 0, top: child2_marginTop,)

      ],
    );

    return stack;
  }


  static Widget child1AlignCenterHoritzontal_child2AlignCenterHorizontal(Widget child1, Widget child2 ){
    return Stack(
      children: [

        Positioned(child: child1, left: 0, right: 0 ),

        Positioned(child: child2, left: 0, right: 0 )

      ],
    );
  }


  //---------------------------------------------------------------  pin to page

  static Widget AlignParentPage( {
    required BuildContext context,
    //top
    Widget? alignLeftTop,
    Widget? alignRightTop,
    Widget? alignCenterTop,

    //center
    Widget? alignCenter,

    //bottom
    Widget? alignLeftBottom,
    Widget? alignRightBottom,
    // Widget? alignCenterBottom,
  } ) {

    alignLeftTop ??= EmptyView.zero();
    alignRightTop ??= EmptyView.zero();
    alignCenterTop ??= EmptyView.zero();
    alignCenter ??= EmptyView.zero();
    alignLeftBottom ??= EmptyView.zero();
    alignRightBottom ??= EmptyView.zero();
    // alignCenterBottom ??= EmptyView.zero();

    return Stack(
        children : [
        //must be first
          EmptyView.allDeviceScreen(context),
          alignLeftTop,
          Positioned(child: alignRightTop,   right: 0, top: 0 ),
          Align(child: alignCenterTop, alignment: Alignment.topCenter ),
          Align(child: alignCenter, alignment: Alignment.center ),
          // Align(child: alignCenterBottom, alignment: Alignment.bottomCenter),
          Positioned(child: alignLeftBottom, left: 0,  bottom: 0 ),
          Positioned(child: alignRightBottom, right: 0,  bottom: 0 ),

          /** - until now not working
           *         Align(child: alignCenterBottom, alignment: Alignment.bottomLeft),
           */

        ]
    );
  }

  //------------------------------------------------------------- pin to fixed view



}