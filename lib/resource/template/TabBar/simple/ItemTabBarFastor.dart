import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/template/TabBar/simple/TabBarFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/TabBar/simple/logic/TabBarController.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
import 'package:flutter/material.dart';

extension ItemTabBarFastorExtension on TabBarFastorState {

  Widget ItemTabBarFastor(String name, int index) {
    return GestureDetector(
        child: contentUIItemTab(name , index),
        onTap: (){
          setState(() {
            selectedIndex = index;
          });

          widget.pressed( index, name );
    });
  }


  Widget contentUIItemTab( String name, int index ){
    return Container(
      width: widget.widthItemTab,
      height: widget.height,
      child: _textAndUnderLine(name, index),
      alignment: Alignment.center,
    );
  }


  Widget _textAndUnderLine(String name, int index){
    return ColumnFastor(children: [
      _textTabItem(name, index ),
      _underline( name, index )
    ]);
  }


  Widget _textTabItem(String name, int index ) {
    return TextFastor( name,
      padding: EdgeInsets.only( bottom: widget.spaceBetweenLabelAndUnderline??0 ),
      fontFamily: widget.fontFamily,
      fontSize: widget.fontSize,
      textAlign: TextAlign.center,
      color: getColorBySelectedStatus( index ),
    );
  }


  Widget _underline(String name, int index){
    return Container(
      child: _cloneSameTextSizeWidget( name ),
      height: widget.heightUnderline??1,
      color: getColorBySelectedStatus( index),
    );
  }


  Widget _cloneSameTextSizeWidget(String name ) {
    String cloneName = _cloneNameToGetSameSize( name );
    var txtClone = TextFastor( cloneName,
      // padding: EdgeInsets.only( bottom: widget.spaceBetweenLabelAndUnderline??0 ),
      fontFamily: widget.fontFamily,
      fontSize: widget.fontSize,
    );
    return txtClone;
  }

  String _cloneNameToGetSameSize(String name ){
    int size = name.length;
    String result = "";
    for( int i = 0 ; i < size ; i++ ) {
      result += " ";
    }
    return result;
  }


}