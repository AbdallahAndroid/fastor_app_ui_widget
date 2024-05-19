


import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/logic/NumberController.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../PaginateBarFastor.dart';


extension NumberViewPaginate on PaginateBarState {

  //---------------------------------------------------------------------------- rows numbers

  Widget  rowNumbersListHorizontal(){
    initNumberListWidget();
      return ListViewTemplate.t(context: context, children: listNumberWidget, axis: Axis.horizontal);
  }



 }