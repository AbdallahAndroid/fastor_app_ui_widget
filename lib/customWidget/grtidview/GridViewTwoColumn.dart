import 'package:flutter/material.dart';

class GridViewTwoColumn extends StatelessWidget {

  /// consctructor variables
  // int span;
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;
  // double widthGridViewParent ;

  /// data
  List<  Widget > columnsChildren1 = [];
  List<  Widget > columnsChildren2 = [];

  GridViewTwoColumn({
    // required this.span,
    required this.children,
    // required this.widthGridViewParent,
    required this.isPutInsideSingleChildScrollView
  }){

    setValues();
  }

  //---------------------------------------------------------- logics


  setValues(){
    forChildrenGridList();
  }

  void forChildrenGridList() {
    for( int i = 0 ; i < children.length ; i++ ) {
      Widget child = children[i];
      if( isEvenNumber( i )) {
        columnsChildren1.add( child ) ;
      } else {
        columnsChildren2.add( child );
      }
    }
  }


  bool isEvenNumber(int number) {
    return number % 2 == 0;
  }



  //---------------------------------------------------------- widget

  @override
  Widget build(BuildContext context) {
    return   Container(
      child:  isPutInsideSingleChildScrollView ? SingleChildScrollView( child: gridViewContentUI() ) : gridViewContentUI(),
    );
  }


  Widget gridViewContentUI(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnsChildren1,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnsChildren2,
        ),
      ],);
  }


}