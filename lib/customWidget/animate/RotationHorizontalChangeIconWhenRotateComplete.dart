import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

class RotationHorizontalChangeIconWhenRotateComplete extends StatefulWidget {

  IconData icon1;
  IconData icon2;
  int secondToFinish;
  int counterRotation;


  RotationHorizontalChangeIconWhenRotateComplete({
    required this.icon1,
    required this.icon2,
    required this.secondToFinish,
    required this.counterRotation,
});

  @override
  _RotationHorizontalChangeIconEveryOneSecondState createState() => _RotationHorizontalChangeIconEveryOneSecondState();

}

class _RotationHorizontalChangeIconEveryOneSecondState extends State<RotationHorizontalChangeIconWhenRotateComplete> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  bool isShowIcon1 = false ;
  int howManyRotateComplete = 0;


  @override
  void initState() {
    super.initState();
    _setupAnimation();
    WidgetsBinding.instance.addPostFrameCallback( (s){
      _startRotation();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setupAnimation(){
    _controller = AnimationController(
      duration:   Duration(seconds: widget.secondToFinish),
      vsync: this,
    );
  }

  void _startRotation() {
    _controller.reset();
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return   AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        setupIsNewRotate(   );
        double rotate360Horizontal = _controller.value  * widget.counterRotation * pi;
        // Log.i("AnimatedBuilder() - _controller.value: ${_controller.value}   /rotate360Horizontal: $rotate360Horizontal");
        return Transform(
          transform: Matrix4.identity()
            ..rotateY(rotate360Horizontal),  // Horizontal 360 degree rotation
          alignment: Alignment.center,
          // child: icon2Widget(),
          child:   isShowIcon1 ? icon1Widget() : icon2Widget(),
          // child:   isShowIcon1 ? icon2Widget() : icon1Widget(),
        );
      },
      child: SizedBox(
        width: Figma.w(100),
        height: Figma.w(100),
      ),
    );
  }

  setupIsNewRotate(  ){
    howManyRotateComplete++;
    int whenToChange = 0;
    if(isShowIcon1 ) {
      whenToChange = widget.counterRotation * widget.secondToFinish;

    } else {
      whenToChange = widget.counterRotation  ;
    }
    if( howManyRotateComplete == whenToChange ) {
      isShowIcon1 = ! isShowIcon1;
      howManyRotateComplete = 0;
    }
  }

  icon1Widget(){
    return Icon( widget.icon1,
        size: Figma.w(100),
        color: ColorResource.iconInsideProgressContainer
    );
  }


  icon2Widget(){
    return Icon( widget.icon2,
        size: Figma.w(100),
        color: ColorResource.iconInsideProgressContainer
    );
  }

}
