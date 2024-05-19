import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/resource/template/button/ButtonFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/stateless/TextFieldFastor.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/PaginateBarFastor.dart';

import 'package:flutter/material.dart';

extension TotalInformationBarPaginate on PaginateBarState {


  Widget totalBarPaginate(){
    var rows =  RowTemplate.wrapChildren( [
      txt_total() ,
      tf_pageGoTo(),
      bt_go() 
    ]);

    //gravity layout
    return Container(
      child: rows,
      // color: Colors.yellow,
      // width: DeviceTools.getWidth(),
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
    );
  }

  Widget txt_total(){
    var txt = "Total "   + widget.maxPage.toString() + " pages Go To Page" ;
    return TextTemplate.t( txt ,
    color: Colors.black,
    margin: EdgeInsets.only(left: 10));
  }

  //-------------------------------------------------------------------- GoTo


  Widget tf_pageGoTo() {
    return TextFieldFastor(
      text_color: Colors.black,
      decorationBackground: BoarderHelper.box(
        // radiusSize: 0,
        // colorBackground: Colors.transparent,
        colorLine: Colors.black
      ),
      hint_color: Colors.transparent,
      keyboardType: TextInputType.number,
      margin: EdgeInsets.only(left: 15 ),
      padding: EdgeInsets.all( 7 ),
      controller:  tf_goto_controller,
      //savge change
      onChanged: (s){

        updateGoToPage(s );

      },
        width: 60
    );

  }

  void updateGoToPage(String newPage ) {
    try {
      pageGoTo = int.parse( newPage );
    }catch (e ){
      /**
       * some time open by keyboard
       */
      Log.e( "paginate - updateGoToPage() exc: " + e.toString()  );
    }

  }
  
  Widget bt_go(){
    return ButtonFastor(  "Go"  , () {

      goToClickFunction();

    } ,
        margin: EdgeInsets.only(left: 15 ),
      background: widget.colorSecondary,
      textColor: widget.colorPrimary,
    );
  }


  void goToClickFunction(){
    //check zero
    if( pageGoTo <= 0 ) {
      msgError =  "Missed Field Go To Page"  ;
    setState(() {

    });
      return;
    }

    //more than maxPage
    Log.i( "goToClickFunction() - maxPage: " + widget.maxPage.toString()  + " /pageGoTo: $pageGoTo" );
    if( pageGoTo > widget.maxPage!  ) {
      msgError =  "Page more than Maximum Page is: " + widget.maxPage.toString()   ;
      setState(() {

      });
      return;
    }

    //more than totalPages
    if( pageGoTo >  widget.itemTotal  ) {
      msgError =   "Page more than totalBar Page is: " + widget.itemTotal.toString()  ;
      setState(() {

      });
      return;
    }

    //update
   // setPaginateByRecordTotal( recordTotal, widget.limitPerPage, pageGoTo);

    //call back
    widget.paginateNumberChange( pageGoTo);
  }
  
  
}