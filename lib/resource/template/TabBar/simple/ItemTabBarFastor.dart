import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/template/TabBar/simple/TabBarFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/TabBar/simple/logic/TabBarController.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/size/TextWidthCalculatorFastor.dart';
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
      color: Colors.transparent,
      padding: EdgeInsets.all( 10 ),
      child: _textAndUnderLine(name, index),
      alignment: Alignment.center,
    );
  }


  Widget _textAndUnderLine(String name, int index){
    return ColumnFastor(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _textTabItem(name, index ),
          _underline( name, index )
        ]);
  }


  Widget _textTabItem(String name, int index ) {
    return TextFastor( name,
      padding: EdgeInsets.only( bottom: widget.spaceBetweenLabelAndUnderline??0 ),
      fontFamily: widget.fontFamily,
      fontSize: widget.fontSize?? 18,
      textAlign: TextAlign.center,
      color: getColorBySelectedStatus( index ),
    );
  }


  Widget _underline(String name, int index){
    return Container(
      width: getSizeTextWidth( name ) + 20 ,
      height: widget.heightUnderline??1,
      alignment: Alignment.center,
      color: getColorUnderline( index),
    );
  }

  getSizeTextWidth(String name) {
    return TextWidthCalculatorFastor.get(
        context: context,
        txt: name,
        dimenFont: widget.fontSize ?? 18
    );
  }


}