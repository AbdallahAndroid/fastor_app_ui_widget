import 'package:flutter/material.dart';

class ColumnApp extends StatelessWidget {

  List<Widget> children = const <Widget>[];
  MainAxisAlignment? mainAxisAlignment ; // = MainAxisAlignment.start,
  MainAxisSize? mainAxisSize; // = MainAxisSize.min,
  CrossAxisAlignment? crossAxisAlignment; // = CrossAxisAlignment.start,
  double? width;
  double? height;

  //new feature not found at flutter v2.8
  Color? colorBackground ;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Decoration? decoration; // pages: decoration: BorderHelper.top_line()
  Alignment? alignment;

  ColumnApp({

    //found before at flutter v2.8
    required List<Widget> this.children ,
    MainAxisAlignment? this.mainAxisAlignment, // = MainAxisAlignment.start,
    MainAxisSize? this.mainAxisSize, // = MainAxisSize.min,
    CrossAxisAlignment? this.crossAxisAlignment, // = CrossAxisAlignment.start,
    double? this.width,
    double? this.height,

    //new feature not found at flutter v2.8
    Color? this.colorBackground ,
    EdgeInsets? this.margin,
    EdgeInsets? this.padding,
    Decoration? this.decoration, // pages: decoration: BorderHelper.top_line()
    Alignment? this.alignment
  });

  @override
  Widget build(BuildContext context) {

    //default gravity layout
    // alignGravity ??= Alignment.topLeft;
    mainAxisAlignment ??= MainAxisAlignment.start;
    mainAxisSize ??= MainAxisSize.min;
    crossAxisAlignment ??= CrossAxisAlignment.start;

    var col = Column(
      mainAxisAlignment: mainAxisAlignment!,
      mainAxisSize: mainAxisSize!,
      crossAxisAlignment: crossAxisAlignment!,
      children: children ,
    );

    var sizeBox = SizedBox(child: col, width: width, height: height );

    var cont = Container(
      alignment: alignment,
      padding: padding,
      width: width,
      height: height,
      margin: margin,
      decoration: decoration,
      child: sizeBox,
      color: colorBackground,
    );

    return cont;
  }
}
