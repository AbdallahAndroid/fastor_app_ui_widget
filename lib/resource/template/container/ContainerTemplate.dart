import 'package:flutter/material.dart';


class ContainerTemplate {


  //------------------------------------------------------------------ type: size


  static Widget wrapContent(Widget child,
  { EdgeInsets? margin, EdgeInsets? padding, Decoration? decoration,
      Alignment? align}) {

    //container
    var ct = Container(
      decoration: decoration,
      padding: padding,
      margin: margin,
      child: child,
      alignment: align
    //test  color:  Colors.black
    );

    /**
        wrap "Container"   content by surround with column
     */
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: crossAxisAlignment.,
      children: [
        ct
      ],
    );
  }


  static Widget fixedSize(Widget child, Size fixedSize,
      EdgeInsets? margin, EdgeInsets? padding, Decoration? decoration,
      Alignment? align) {


    //check aligment center
    if ( align == Alignment.center ) {
      return  _fixedSize_alignmentCenter(child, fixedSize, margin, padding, decoration, align);
    }

    //container
    var ct = Container(
      width: fixedSize.width,
        height: fixedSize.height,
        decoration: decoration,
        padding: padding,
        margin: margin,
        child: child,
        alignment: align
      //test  color:  Colors.black
    );


    return ct;
  }

  static Widget _fixedSize_alignmentCenter(Widget child, Size fixedSize,
      EdgeInsets? margin, EdgeInsets? padding, Decoration? decoration,
      Alignment? align) {

   // Log.i( "_fixedSize_alignmentCenter() - fixedSize: " + fixedSize.toString() );
    //container
    var ct = Container(
        margin: margin,
        alignment: align,
        width: fixedSize.width,
        height: fixedSize.height,
        padding: padding,
        child: child,
        decoration: decoration
      //test  color:  Colors.black
    );

    return ct;
  }

  //------------------------------------------------------------------------ fixed width

  static Widget fixedWidth(Widget child, double width,
      EdgeInsets? margin, EdgeInsets? padding, Decoration? decoration,
      Alignment? align) {


    //check aligment center
    if ( align == Alignment.center ) {
      return  _fixedSize_alignmentCenter_width(child, width, margin, padding, decoration, align);
    }

    //container
    var ct = Container(
        width: width,
        decoration: decoration,
        padding: padding,
        margin: margin,
        child: child,
        alignment: align
      //test  color:  Colors.black
    );


    return ct;
  }


  static Widget _fixedSize_alignmentCenter_width(Widget child, double width,
      EdgeInsets? margin, EdgeInsets? padding, Decoration? decoration,
      Alignment? align) {

    //container
    var ct = Container(
        width: width,
        padding: padding,
        child: child,
        decoration: decoration
      //test  color:  Colors.black
    );

    return Container( child:  ct,
        margin: margin,
        alignment: align);
  }

  //---------------------------------------------------------------------- match parent

  static Widget matchParent(Widget child,
      {EdgeInsets? margin, EdgeInsets? padding, Decoration? decoration,
      Alignment? align}
      ) {

   // Log.i( "ContainerTemplate - matchParent()" );

    //container
    var ct = Container(

      margin: margin,
      child: child,
      width: double.maxFinite,
      alignment: align,
    );

    return ct;
  }


}