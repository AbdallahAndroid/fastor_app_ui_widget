


import 'package:flutter/material.dart';

@Deprecated( "Under Development")
class GestureDetectorTemplate  {


  static Widget t(   {
    required Widget child,
    required VoidCallback  onPressed,
    EdgeInsets? paddingClick }) {

    var container = Container( child: child, padding:  paddingClick );

    return GestureDetector(

        child: container,
        onTap: onPressed
    );
  }

}