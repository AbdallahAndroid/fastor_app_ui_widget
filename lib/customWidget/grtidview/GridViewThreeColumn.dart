import 'package:flutter/material.dart';

class GridViewThreeColumn extends StatelessWidget {
  /// consctructor variables
  // int span;
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;

  /// data
  List<Widget> _columnsChildren1 = [];
  List<Widget> _columnsChildren2 = [];
  List<Widget> _columnsChildren3 = [];

  GridViewThreeColumn(
      {required this.children,
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
      if (i % 3 == 0) {
        _columnsChildren1.add(child);
      } else if (i % 3 == 1) {
        _columnsChildren2.add(child);
      } else if (i % 3 == 2) {
        _columnsChildren3.add(child);
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
      ],
    );
  }
}
