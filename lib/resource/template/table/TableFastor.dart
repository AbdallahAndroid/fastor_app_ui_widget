import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:flutter/material.dart';

class TableFastor extends StatelessWidget {

  final List<Widget> listRow;

  TableFastor(  { required  this.listRow} );

  @override
  Widget build(BuildContext context) {

    // LogDebug.i( "TableState() - listRow: " + listRow.length.toString()  );

    //get listView
    var listView =  ListViewTemplate.t(context: context,
        children: listRow,
        axis: Axis.vertical,
        axisBoth: true);
    return listView;
  }

}