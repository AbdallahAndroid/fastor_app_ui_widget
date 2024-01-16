import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/progressView/ProgressCircleFastor.dart';
import 'package:flutter/material.dart';

class TableFastor extends StatelessWidget {

  final List<Widget> listRow;
  //progress
  bool? showProgress;
  double? sizeProgress;
  Color? colorProgress;

  BuildContext? context;

  TableFastor(  { required  this.listRow,
    this.showProgress,
    this.sizeProgress,
    this.colorProgress,
  } ){

    showProgress ??= false;
    setDefaultProgressSize();
  }

  setDefaultProgressSize(){

    //case have size
    if( sizeProgress != null ) return;

    //case have height
    sizeProgress ??= 30;
  }


  @override
  Widget build(BuildContext context) {
    this.context = context;
    // LogDebug.i( "TableState() - listRow: " + listRow.length.toString()  );

    return chooseTableOrProgressViewInsideButton();
  }


  Widget chooseTableOrProgressViewInsideButton(){
    if( showProgress!){
      return progressContainer();
    } else {
      return _showListView();
    }
  }

  Widget progressContainer(){
    var prog = ProgressCircleFastor(size: sizeProgress, color: colorProgress);
    return SizedBox( width: sizeProgress! * 2, child: prog );
  }



  Widget _showListView() {
    //get listView
    var listView =  ListViewTemplate.t(context: context!,
        children: listRow,
        axis: Axis.vertical,
        axisBoth: true);
    return listView;
  }

}