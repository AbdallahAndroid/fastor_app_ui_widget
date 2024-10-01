
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IconCircleCustom extends StatelessWidget {

  double width;
  GestureTapCallback onTap;
  IconData? iconData;
  Widget? child;


  IconCircleCustom( {
    required this.width,
    required this.onTap,
    this.iconData,
    this.child
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius:   BorderRadius.all( Radius.circular( width  ) ),
        child: Container(
          padding: EdgeInsets.all( width / 2 ),
          color: Colors.black,
          child: child != null ? child : iconView(),
        ),
      ),
    );
  }

  iconView(){
    return Icon( iconData??Icons.add,
      color: Colors.white60,
      size: width,
    );
  }

}