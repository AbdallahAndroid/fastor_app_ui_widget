import 'package:fastor_app_ui_widget/customWidget/grtidview/GridViewFiveColumn.dart';
import 'package:fastor_app_ui_widget/customWidget/grtidview/GridViewFourColumn.dart';
import 'package:fastor_app_ui_widget/customWidget/grtidview/GridViewSixColumn.dart';
import 'package:fastor_app_ui_widget/customWidget/grtidview/GridViewThreeColumn.dart';
import 'package:fastor_app_ui_widget/customWidget/grtidview/GridViewTwoColumn.dart';
import 'package:flutter/material.dart';


class GridViewApp extends StatelessWidget {
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;


  int span;
  MainAxisAlignment mainAxisAlignment;

  GridViewApp(
      {
        required this.span,
        required this.children,
        required this.mainAxisAlignment,
      required this.isPutInsideSingleChildScrollView}) ;


  //---------------------------------------------------------- widget

  @override
  Widget build(BuildContext context) {
    if( span <=0 ) return SizedBox();
    if( children.isEmpty ) return SizedBox();
    if( span == 2 ) {
      return GridViewTwoColumn(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );
    } else if( span == 3 ) {
      return GridViewThreeColumn(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );
    } else if( span == 4 ) {
      return GridViewFourColumn(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );
    } else if( span == 5 ) {
      return GridViewFiveColumn(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );

      ///default max 6
    } else {
      return GridViewSixColumn(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );
    }

  }


}
