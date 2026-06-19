import 'package:flutter/material.dart';

class GridViewSevenColumn extends StatelessWidget {
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;

  /// data
  List<Widget> _columnsChildren1 = [];
  List<Widget> _columnsChildren2 = [];
  List<Widget> _columnsChildren3 = [];
  List<Widget> _columnsChildren4 = [];
  List<Widget> _columnsChildren5 = [];
  List<Widget> _columnsChildren6 = [];
  List<Widget> _columnsChildren7 = [];

  MainAxisAlignment mainAxisAlignment;


  double marginBetweenItems   ;

  GridViewSevenColumn(
      {required this.children,
        required this.mainAxisAlignment,
        required this.marginBetweenItems,
      required this.isPutInsideSingleChildScrollView}) {
    setValues();
  }

  //---------------------------------------------------------- logics

  setValues() {
    forChildrenGridList();
    if( children.length >= 7 ) {
      mainAxisAlignment = MainAxisAlignment.center;
    }
  }

  void forChildrenGridList() {
    for (int i = 0; i < children.length; i++) {
      Widget child = children[i];
      if (i % 7 == 0) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 0");
        _columnsChildren1.add(child);
      } else if (i % 7 == 1) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 1");
        _columnsChildren2.add(child);
      } else if (i % 7 == 2) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 2");
        _columnsChildren3.add(child);
      } else if (i % 7 == 3) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 3");
        _columnsChildren4.add(child);
      } else if (i % 7 == 4) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 4");
        _columnsChildren5.add(child);
      } else if (i % 7 == 5) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 5");
        _columnsChildren6.add(child);
      } else if (i % 7 == 6) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 5");
        _columnsChildren7.add(child);
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
        SizedBox( width: marginBetweenItems,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren5,
        ),
        SizedBox( width: marginBetweenItems,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren6,
        ),
        SizedBox( width: marginBetweenItems,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren7,
        ),
      ],
    );
  }
}
