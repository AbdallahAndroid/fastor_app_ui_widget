

import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/PaginateBarFastor.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/logic/ButtonNextPreviousController.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/widget/NumberViewPaginate.dart';
import 'package:flutter/material.dart';


extension ButtonBarPaginate on PaginateBarState {


  Widget buttonBarPaginate() {
    return Container(
        child: _buttonPrevousAndNumbersPagesListAndButtonNext(),
        alignment: Alignment.center,
      margin: EdgeInsets.only( left: 10 )
    );
  }


  Widget _buttonPrevousAndNumbersPagesListAndButtonNext(){
    return RowTemplate.wrapChildren_gravityCenter( [
        _btPrevious(),
        rowNumbersListHorizontal(),
      _btNext()
    ]  );
  }

  //---------------------------------------------------------------------------- next and previouis

  Widget _btPrevious(){
    return ButtonApp( "Previous" , () {

      previousButtonFunction();
    } ,
      background: widget.colorSecondary,
      textColor: widget.colorPrimary,
        margin: EdgeInsets.only( right: 20)
    );
  }


  Widget _btNext(){
    return ButtonApp( "Next"  , () {
      nextButtonFunction();
    } ,
      background: widget.colorSecondary,
      textColor: widget.colorPrimary,
    );
  }


}