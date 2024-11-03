import 'package:flutter/material.dart';


abstract class BaseBoarderHelper {

  //---------------------------------------------------------------------- line circle


  static BoxDecoration circle( {
    double radiusSize = 10 ,
    Color colorBackground = Colors.green,
    double widthLine = 5 ,
    Color colorLine = Colors.red,
  }) {


    //radius
    var objRadius = Radius.circular(radiusSize);
    var radius = BorderRadius.all(  objRadius );

    //shadow
    var s1 = BoxShadow(
        color: colorLine,
        blurRadius: radiusSize,
        offset: Offset(widthLine,widthLine),
        blurStyle: BlurStyle.inner
    );
    List<BoxShadow> listShadow = [];
    listShadow.add(s1);

    //box
    var box = BoxDecoration(
        boxShadow:  listShadow,
        borderRadius: radius ,
        color: colorBackground
    );
    return box;
  }


  //---------------------------------------------------------------------- line one side

  static BoxDecoration bottom_line( {
    double radiusSize = 10 ,
    Color colorBackground = Colors.green,
    double widthLine = 5 ,
    Color colorLine = Colors.red,
  }) {


    //radius
    var objRadius = Radius.circular(radiusSize);
    var radius = BorderRadius.only( bottomLeft: objRadius, bottomRight:  objRadius  );

    //shadow
    var s1 = BoxShadow(
        color: colorLine,
        blurRadius: radiusSize,
        offset: Offset(0,widthLine),
        blurStyle: BlurStyle.inner
    );
    List<BoxShadow> listShadow = [];
    listShadow.add(s1);

    //box
    var box = BoxDecoration(
        boxShadow:  listShadow,
        borderRadius: radius ,
        color: colorBackground
    );
    return box;
  }



  static BoxDecoration top_line( {
    double radiusSize = 10 ,
    Color colorBackground = Colors.green,
    double widthLine = 5 ,
    Color colorLine = Colors.red,
  }) {


    //radius
    var objRadius = Radius.circular(radiusSize);
    var radius = BorderRadius.only( topLeft: objRadius, topRight:  objRadius  );

    //shadow
    var s1 = BoxShadow(
        color: colorLine,
        blurRadius: radiusSize,
        offset: Offset(0,-widthLine), //negative to make top line
        blurStyle: BlurStyle.inner
    );
    List<BoxShadow> listShadow = [];
    listShadow.add(s1);

    //box
    var box = BoxDecoration(
        boxShadow:  listShadow,
        borderRadius: radius ,
        color: colorBackground
    );
    return box;
  }


}