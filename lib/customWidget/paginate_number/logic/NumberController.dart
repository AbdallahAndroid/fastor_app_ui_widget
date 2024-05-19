

import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/PaginateBarApp.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/widget/boxNumberItem.dart';
import 'package:flutter/material.dart';

extension NumberController on PaginateBarState {

  //--------------------------------------------------------------------- draw list

  void initNumberListWidget(){
    //remove previous
    listNumberWidget = [];

    /// case the page

    if( _isTypeNumberDecending() ) {
      caseNumberSortDecending();
    } else {
      caseNumberSortAcending();
    }
    Log.i( "PaginateNumberWidget - initNumberListWidget() - size: ${listNumberWidget.length} " );
  }

  bool _isTypeNumberDecending(){
    bool isLastPage = widget.currentPage == widget.maxPage;
    if(isLastPage) return true;
    int lastPageMinesCounterBar = widget.maxPage - _calculateCounterTabButtonNeedToShow();
    bool isOneOfLastSevenPages = widget.currentPage >  lastPageMinesCounterBar;
    if( isOneOfLastSevenPages ) return true;
    return false;
  }

  //-------------------------------------------------------------------------- ascending

  void caseNumberSortAcending() {
    //maximue
    int starter = _asendingModeCalculateStarterNeedoShow();
    int maxCounterButtonInBar = _calculateCounterTabButtonNeedToShow() ;
    int usedBarArea = 0;

    //for loop widget
    for( int tabIndexNumber = starter ; tabIndexNumber <= widget.maxPage ; tabIndexNumber++ ){


      //selected
      bool isCurrentPage = tabIndexNumber == widget.currentPage;
      Log.i( "PaginateNumberWidget - caseNumberSortAcending() - tabIndexNumber: $tabIndexNumber /isCurrentPage: " + isCurrentPage.toString() );

      //check arrive max needed to show
      bool usedAllAreaToSetCounterTabItem = maxCounterButtonInBar  <= usedBarArea;
      if( usedAllAreaToSetCounterTabItem ) {
        break;
      }


      //add
      Widget w = boxNumberItem(page: tabIndexNumber, isSelected: isCurrentPage );
      listNumberWidget.add( w );
      usedBarArea = usedBarArea + 1;
    }
  }


  int _asendingModeCalculateStarterNeedoShow(){

    ///case current page is zero
    if( widget.currentPage == 0 ) {
      var defaultStarter = 1;
      return defaultStarter;
    }
    /// case medium len
    return widget.currentPage;
  }

  //-------------------------------------------------------------------------- decending

  void caseNumberSortDecending() {
    //maximue
    int starter = widget.maxPage;
    int maxCounterButtonInBar = _calculateCounterTabButtonNeedToShow();
    // Log.i( "PaginateNumberWidget - caseNumberSortDecending() - starter: $starter /maxCounterButtonInBar: " + maxCounterButtonInBar.toString() );

    int position = 0;

    //for loop widget
    for( int tabIndexNumber = starter ; tabIndexNumber >= 1 ; tabIndexNumber-- ){

      //selected
      bool isCurrentPage = tabIndexNumber == widget.currentPage;
      Log.i( "PaginateNumberWidget - caseNumberSortDecending() - tabIndexNumber: $tabIndexNumber /isCurrentPage: " + isCurrentPage.toString() );

      //check arrive max needed to show
      if( maxCounterButtonInBar <= position ) {
        break;
      }

      //add
      Widget w = boxNumberItem(page: tabIndexNumber, isSelected: isCurrentPage );
      listNumberWidget.add( w );

      position = position + 1;
    }

    //reserot
    List<Widget> sort  = [];
    for( int i = listNumberWidget.length-1   ; i >= 0 ; i-- ) {
      var value = listNumberWidget[i];
      sort.add( value );
    }

    listNumberWidget = sort;
  }


  //-------------------------------------------------------------------------- tools


  int _calculateCounterTabButtonNeedToShow(){
    int max = 7;
    if( DeviceTools.isPortrait( context) ){
      max = 3;
    }
    return max;
  }





}