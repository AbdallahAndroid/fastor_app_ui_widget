
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/template/button/ButtonTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/container/ContainerTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/admin/paginate_number/PaginateBarFastor.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/admin/paginate_number/logic/ButtonNextPreviousController.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/admin/paginate_number/widget/NumberViewPaginate.dart';
import 'package:flutter/material.dart';


extension ButtonBarPaginate on PaginateBarState {


  Widget buttonBarPaginate() {
    return ContainerTemplate.wrapContent(
        _buttonPrevousAndNumbersPagesListAndButtonNext()
        , align: Alignment.center,
      margin: EdgeInsets.only( left: DSDimen.space_level_2 )
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
    return ButtonTemplate.t( "Previous".arf( "السابق") , () {

      previousButtonFunction();
    } ,
      background: widget.colorSecondary,
      textColor: widget.colorPrimary,
        margin: EdgeInsets.only( right: DSDimen.space_level_4 ), //left: DSDimen.space_level_1,
        levelDS: LevelDS.l2,
    );
  }


  Widget _btNext(){
    return ButtonTemplate.t( "Next".arf( "التالي") , () {
      nextButtonFunction();
    } ,
        levelDS: LevelDS.l2,
      background: widget.colorSecondary,
      textColor: widget.colorPrimary,
    );
  }


}