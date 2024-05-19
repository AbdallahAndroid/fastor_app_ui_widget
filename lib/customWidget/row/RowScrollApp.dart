import 'package:fastor_app_ui_widget/customWidget/listview/ListViewApp.dart';
import 'package:flutter/material.dart';

class RowScrollApp extends StatelessWidget {

  List<Widget> children;

  RowScrollApp( {required this.children});

  @override
  Widget build(BuildContext context) {
    return ListViewApp.t(context: context, children: children, axis: Axis.horizontal);
  }
}