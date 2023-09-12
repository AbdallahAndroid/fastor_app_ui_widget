
import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:log_debug/log_debug.dart';
import 'package:flutter/material.dart';

class TableViewFastor extends StatefulWidget {

  List<Widget> listRow;
  ValueChanged< TableViewFastorState>? stateListener;

  TableViewFastor( List<Widget>  this.listRow , {
    ValueChanged<TableViewFastorState>? this.stateListener
  });


  @override
  TableViewFastorState createState() {
    var state =  TableViewFastorState( listRow );
    if( stateListener != null ) {
      stateListener!(state);
    }
    return state;
  }


}

class TableViewFastorState extends State<TableViewFastor> {

  List<Widget> listRow;

  TableViewFastorState( List<Widget>  this.listRow );

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