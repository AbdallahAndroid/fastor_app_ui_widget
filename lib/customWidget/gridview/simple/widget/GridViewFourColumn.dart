import 'package:flutter/material.dart';

class GridViewFourColumn extends StatelessWidget {
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;

  /// data
  List<Widget> _columnsChildren1 = [];
  List<Widget> _columnsChildren2 = [];
  List<Widget> _columnsChildren3 = [];
  List<Widget> _columnsChildren4 = [];

  MainAxisAlignment mainAxisAlignment;


  double marginBetweenItems   ;

  GridViewFourColumn(
      {required this.children,
        required this.mainAxisAlignment,
        required this.marginBetweenItems,
      required this.isPutInsideSingleChildScrollView}) {
    setValues();
  }

  //---------------------------------------------------------- logics

  setValues() {
    forChildrenGridList();
    if( children.length >= 4 ) {
      mainAxisAlignment = MainAxisAlignment.center;
    }
  }

  void forChildrenGridList() {
    for (int i = 0; i < children.length; i++) {
      Widget child = children[i];
      if (i % 4 == 0) {
        _columnsChildren1.add(child);
      } else if (i % 4 == 1) {
        _columnsChildren2.add(child);
      } else if (i % 4 == 2) {
        _columnsChildren3.add(child);
      } else if (i % 4 == 3) {
        _columnsChildren4.add(child);
      }
    }
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
          children: _columnsChildren1,
        ),
        SizedBox( width: marginBetweenItems,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren2,
        ),
        SizedBox( width: marginBetweenItems,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren3,
        ),
        SizedBox( width: marginBetweenItems,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren4,
        ),

      ],
    );
  }
}
