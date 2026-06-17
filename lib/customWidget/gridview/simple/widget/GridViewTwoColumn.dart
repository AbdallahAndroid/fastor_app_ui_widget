import 'package:flutter/material.dart';

class GridViewTwoColumn extends StatelessWidget {
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;
  List<Widget> columnsChildren1 = [];
  List<Widget> columnsChildren2 = [];
  MainAxisAlignment mainAxisAlignment;

  double marginBetweenItems   ;

  GridViewTwoColumn(
      {
        required this.mainAxisAlignment,
      required this.children,
        required this.marginBetweenItems,
      required this.isPutInsideSingleChildScrollView}) {
    setValues();
  }

  //---------------------------------------------------------- logics

  setValues() {
    forChildrenGridList();
    if( children.length >= 2) {
      mainAxisAlignment = MainAxisAlignment.center;
    }
  }

  void forChildrenGridList() {
    for (int i = 0; i < children.length; i++) {
      Widget child = children[i];
      if (isEvenNumber(i)) {
        columnsChildren1.add(child);
      } else {
        columnsChildren2.add(child);
      }
    }
  }

  bool isEvenNumber(int number) {
    return number % 2 == 0;
  }

  //---------------------------------------------------------- widget

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isPutInsideSingleChildScrollView
          ? SingleChildScrollView(child: gridViewContentUI())
          : gridViewContentUI(),
    );
  }

  Widget gridViewContentUI() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnsChildren1,
        ),
        SizedBox( width: marginBetweenItems,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnsChildren2,
        ),
      ],
    );
  }
}
