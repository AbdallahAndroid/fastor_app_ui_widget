import 'package:flutter/material.dart';

import 'GridViewFiveColumn.dart';
import 'GridViewFourColumn.dart';
import 'GridViewSevenColumn.dart';
import 'GridViewSixColumn.dart';
import 'GridViewThreeColumn.dart';
import 'GridViewTwoColumn.dart';
// import 'package:maqsafy/core/utils/log/Log.dart';
// import 'package:maqsafy/core/widgets/gridview/GridViewFiveColumn.dart';
// import 'package:maqsafy/core/widgets/gridview/GridViewFourColumn.dart';
// import 'package:maqsafy/core/widgets/gridview/GridViewSevenColumn.dart';
// import 'package:maqsafy/core/widgets/gridview/GridViewSixColumn.dart';
// import 'package:maqsafy/core/widgets/gridview/GridViewThreeColumn.dart';
// import 'package:maqsafy/core/widgets/gridview/GridViewTwoColumn.dart';


class GridViewApp extends StatelessWidget {

  /// example : children: services.map( ( element ) => StudentServiceGridItem( service: element ,) ).toList(),
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;


  int span;
  MainAxisAlignment mainAxisAlignment;


  double marginBetweenItemsHorizontal   ;

  GridViewApp(
      {
        required this.span,
        required this.children,
        required this.mainAxisAlignment,
        required this.marginBetweenItemsHorizontal,
      required this.isPutInsideSingleChildScrollView}) ;


  //---------------------------------------------------------- widget

  @override
  Widget build(BuildContext context) {
    if( span <=0 ) return SizedBox();
    if( children.isEmpty ) return SizedBox();
    if( span == 2 ) {
      return GridViewTwoColumn(
          children: children,
          marginBetweenItems: marginBetweenItemsHorizontal,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );
    } else if( span == 3 ) {
      return GridViewThreeColumn(
          children: children,
          marginBetweenItems: marginBetweenItemsHorizontal,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );
    } else if( span == 4 ) {
      return GridViewFourColumn(
          children: children,
          marginBetweenItems: marginBetweenItemsHorizontal,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );
    } else if( span == 5 ) {
      return GridViewFiveColumn(
          children: children,
          marginBetweenItems: marginBetweenItemsHorizontal,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );

    } else if( span == 6 ) {
      return GridViewSixColumn(
          children: children,
          marginBetweenItems: marginBetweenItemsHorizontal,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );

      ///default max 7
    }else {
      return GridViewSevenColumn(
          children: children,
          marginBetweenItems: marginBetweenItemsHorizontal,
          mainAxisAlignment: mainAxisAlignment,
          isPutInsideSingleChildScrollView: isPutInsideSingleChildScrollView
      );
    }

  }


}
