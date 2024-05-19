

import 'package:fastor_app_ui_widget/resource/template/button/ButtonTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/container/ContainerTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/PaginateBarFastor.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/logic/ButtonNextPreviousController.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/widget/NumberViewPaginate.dart';
import 'package:flutter/material.dart';


extension ButtonBarPaginate on PaginateBarState {


  Widget buttonBarPaginate() {
    return ContainerTemplate.wrapContent(
        _buttonPrevousAndNumbersPagesListAndButtonNext()
        , align: Alignment.center,
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
    return ButtonTemplate.t( "Previous" , () {

      previousButtonFunction();
    } ,
      background: widget.colorSecondary,
      textColor: widget.colorPrimary,
        margin: EdgeInsets.only( right: 20)
    );
  }


  Widget _btNext(){
    return ButtonTemplate.t( "Next"  , () {
      nextButtonFunction();
    } ,
      background: widget.colorSecondary,
      textColor: widget.colorPrimary,
    );
  }


}