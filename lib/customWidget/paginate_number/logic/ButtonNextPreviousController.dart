

import 'package:fastor_app_ui_widget/customWidget/paginate_number/PaginateBarFastor.dart';
import 'package:fastor_app_ui_widget/customWidget/paginate_number/logic/NumberController.dart';

extension ButtonNextPreviousController on PaginateBarState {

  void previousButtonFunction(){
    bool minArrive = ( widget.currentPage - 1 ) == 0;
    // Log.i("PaginateNumberWidget - previousButtonFunction() - minArrive: $minArrive /currentPage: ${widget.currentPage}");

    //check min zero
    if( minArrive) {
      widget.currentPage = 1;
       msgError =  "No Previous Page Found"  ;
       setState(() {

       });
      return;
    }
    msgError = null;

    //change current page
    widget.currentPage = widget.currentPage-1;

    //redraw list numbers
    initNumberListWidget();

    setState(() {

    });

    // Log.i("PaginateNumberWidget - previousButtonFunction() - result currentPage: ${widget.currentPage}");

    //call
    widget.paginateNumberChange(widget.currentPage);

  }


  void nextButtonFunction(){
    bool maxArrive = ( widget.currentPage   ) == widget.maxPage;
    // Log.i("PaginateNumberWidget - nextButtonFunction() - maxArrive: $maxArrive /currentPage: ${widget.currentPage}");

    //check maxPage
    if( maxArrive ) {
      String title = "The max page is: "  ;
      msgError =    title +widget.maxPage.toString() ;
      setState(() {

      });
      return;
    }
    msgError = null;

    //change current page
    widget.currentPage = widget.currentPage + 1;

    //redraw list numbers
    initNumberListWidget();

    setState(() {

    });

    //call
    widget.paginateNumberChange(widget.currentPage);
  }


}