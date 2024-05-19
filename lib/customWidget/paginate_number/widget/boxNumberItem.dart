
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/resource/template/click/GestureDetectorTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/PaginateBarFastor.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/logic/NumberController.dart';
import 'package:flutter/material.dart';

extension BoxNumberItem on PaginateBarState {


  //----------------------------------------------------------------------- build

  Widget boxNumberItem({
    required int page ,
    required bool isSelected}){

    var textWidget =  TextTemplate.t( "" + page.toString()  ,
        color: Colors.black,
        padding: EdgeInsets.symmetric( horizontal: 20 , vertical: 6),
        margin: EdgeInsets.only( right: 20 ),
        height: 25,
        decoration: isSelected? decoration_selected() : decoration_unselected()
    );

    return setupClickOnThisNumber( page, isSelected, textWidget);
    // return textWidget;
  }


  BoxDecoration decoration_selected() {
    return BoarderHelper.rounded(
        radiusSize: 20 ,
        colorBackground: Colors.grey // colorBackground: DSColor.tap_active
    );
  }


  BoxDecoration decoration_unselected() {
    return BoarderHelper.rounded( radiusSize: 20 ,
        colorBackground:  Colors.green );
  }

  //------------------------------------------------------------------------- click on number

  Widget setupClickOnThisNumber(int page, bool isSelected, Widget textWidget) {

    return GestureDetectorTemplate.t(child : textWidget, onPressed:  (){
      Log.i( "setupClickOnThisNumber() - Click page: " + page.toString()  );

      msgError = null;

      // //update selected
      widget.currentPage = page;

      //redraw list numbers
      initNumberListWidget();

      setState(() {

      });

      //interface
      widget.paginateNumberChange(page);
    }
        , paddingClick: EdgeInsets.all(5 ) );
  }

}