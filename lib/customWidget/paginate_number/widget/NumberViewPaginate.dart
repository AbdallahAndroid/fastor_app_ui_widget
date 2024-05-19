


import 'package:fastor_app_ui_widget/customWidget/listview/ListViewApp.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/logic/NumberController.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../PaginateBarApp.dart';


extension NumberViewPaginate on PaginateBarState {

  //---------------------------------------------------------------------------- rows numbers

  Widget  rowNumbersListHorizontal(){
    initNumberListWidget();
      return ListViewApp.t(context: context, children: listNumberWidget, axis: Axis.horizontal);
  }



 }
