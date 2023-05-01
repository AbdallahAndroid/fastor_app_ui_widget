import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:flutter/material.dart';

class RowScrollFastor extends StatelessWidget {

  List<Widget> children;

  RowScrollFastor( {required this.children});

  @override
  Widget build(BuildContext context) {
    return ListViewTemplate.t(context: context, children: children, axis: Axis.horizontal);
  }
}