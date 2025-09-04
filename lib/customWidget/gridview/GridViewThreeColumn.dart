import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GridViewThreeColumn extends StatelessWidget {
  List<Widget> children;
  bool isPutInsideSingleChildScrollView;

  /// data
  List<Widget> _columnsChildren1 = [];
  List<Widget> _columnsChildren2 = [];
  List<Widget> _columnsChildren3 = [];

  MainAxisAlignment mainAxisAlignment;

  double marginBetweenItems   ;

  GridViewThreeColumn(
      {required this.children,
        required this.mainAxisAlignment,
        required this.marginBetweenItems,
      required this.isPutInsideSingleChildScrollView}) {
    setValues();
  }

  //---------------------------------------------------------- logics

  setValues() {
    forChildrenGridList();
    if( children.length >= 3 ) {
      mainAxisAlignment = MainAxisAlignment.center;
    }
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
          ? SingleChildScrollView(child: gridViewContentUI(context))
          : gridViewContentUI(context),
    );
  }

  Widget gridViewContentUI(BuildContext context ) {
    return Container(
      // alignment: Alignment.topRight,
      // color: Colors.yellow,
      // width: DeviceTools.getWidth(context),
      child: Row(
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
        ],
      ),
    );
  }
}
