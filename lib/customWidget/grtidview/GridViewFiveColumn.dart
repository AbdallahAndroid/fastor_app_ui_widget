import 'package:flutter/material.dart';

class GridViewFiveColumn extends StatelessWidget {
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;

  /// data
  List<Widget> _columnsChildren1 = [];
  List<Widget> _columnsChildren2 = [];
  List<Widget> _columnsChildren3 = [];
  List<Widget> _columnsChildren4 = [];
  List<Widget> _columnsChildren5 = [];

  MainAxisAlignment mainAxisAlignment;

  GridViewFiveColumn(
      {required this.children,
        required this.mainAxisAlignment,
      required this.isPutInsideSingleChildScrollView}) {
    setValues();
  }

  //---------------------------------------------------------- logics

  setValues() {
    forChildrenGridList();
  }

  void forChildrenGridList() {
    for (int i = 0; i < children.length; i++) {
      Widget child = children[i];
      if (i % 5 == 0) {
        _columnsChildren1.add(child);
      } else if (i % 5 == 1) {
        _columnsChildren2.add(child);
      } else if (i % 5 == 2) {
        _columnsChildren3.add(child);
      } else if (i % 5 == 3) {
        _columnsChildren4.add(child);
      } else if (i % 5 == 4) {
        _columnsChildren5.add(child);
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren3,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren4,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren5,
        ),
      ],
    );
  }
}
