import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';


class GridViewSixColumn extends StatelessWidget {
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;

  /// data
  List<Widget> _columnsChildren1 = [];
  List<Widget> _columnsChildren2 = [];
  List<Widget> _columnsChildren3 = [];
  List<Widget> _columnsChildren4 = [];
  List<Widget> _columnsChildren5 = [];
  List<Widget> _columnsChildren6 = [];

  MainAxisAlignment mainAxisAlignment;

  GridViewSixColumn(
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
      if (i % 6 == 0) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 0");
        _columnsChildren1.add(child);
      } else if (i % 6 == 1) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 1");
        _columnsChildren2.add(child);
      } else if (i % 6 == 2) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 2");
        _columnsChildren3.add(child);
      } else if (i % 6 == 3) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 3");
        _columnsChildren4.add(child);
      } else if (i % 6 == 4) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 4");
        _columnsChildren5.add(child);
      } else if (i % 6 == 5) {
        // Log.i("GridViewSixColumn - forChildrenGridList() - i: $i - case 5");
        _columnsChildren6.add(child);
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _columnsChildren6,
        ),
      ],
    );
  }
}
