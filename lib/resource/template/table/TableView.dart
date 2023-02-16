
import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:log_debug/log_debug.dart';
import 'package:flutter/material.dart';

class TableView extends StatefulWidget {

  List<Widget> listRow;
  ValueChanged<TableState>? stateListener;

  TableView( List<Widget>  this.listRow , {
    ValueChanged<TableState>? this.stateListener
  });


  @override
  TableState createState() {
    var state =  TableState( listRow );
    if( stateListener != null ) {
      stateListener!(state);
    }
    return state;
  }


}

class TableState extends State<TableView> {

  List<Widget> listRow;

  TableState( List<Widget>  this.listRow );

  //-------------------------------------------------------------------------- public methods

  void updateList(List<Widget> updateListRow ) {
    this.listRow = updateListRow;
    setState(() {

    });
  }

  //-------------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {

    LogDebug.i( "TableState() - listRow: " + listRow.length.toString()  );

    //get listView
    var listView =  ListViewTemplate.t(context: context, children: listRow,
        axis: Axis.vertical, axisBoth: true);


    return listView;
  }



}