import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/progress_circle_container.dart';
import 'package:flutter/material.dart';


typedef PageinateListviewOnScrollBottomChange = Function(   );

/// example
/// 1- in presentation layer
///         List<DriverModel> data = cubit.driversResponse?.drivers??[];
//         return PaginateListview(
//           padding: EdgeInsets.only(bottom: 100.hr ),
//           children:  data.map<Widget>( (model ) => DriverMangeItem(model )).toList(),
//           isLoadingNextPage:   state is DriversDownloadingListState,
//           onScrollArriveBottomAndValidToGetNextPageChange: (   ){
//             cubit.getNextPageDriver();
//           },
//         );
///
/// 2- in cubit
// getFirstPageDriver() async {
//   downloadDriverPage= 1;
//   driversResponse = null;
//   downloadDrivers();
// }
//
//
// getNextPageDriver() async {
//   int current = driversResponse?.meta?.currentPage??1;
//   downloadDriverPage  = current  + 1;
//   downloadDrivers();
// }
//
//
// downloadDrivers() async {
//   Log.i("downloadDrivers() - start downloadDriverPage: $downloadDriverPage");
//
//   /// emit
//   emit(DriversDownloadingListState());
//
//
//   Either<Failure, DriversResponse> either = await driversDownloadUsecase( downloadDriverPage );
//   return either.fold((failure) {
//     var msg = getFailureMessage(failure);
//     Log.i("downloadDrivers() - failure: $failure");
//     emit(DriversDownloadListErrorState(msg));
//   }, (response) async {
//
//     /// update page
//     downloadDriverPage = response.meta?.currentPage??1;
//     Log.i("downloadDrivers() - success - downloadDriverPage: $downloadDriverPage");
//
//     /// choose : append or replace first page
//     if( downloadDriverPage == 1  ) {
//       driversResponse = response;
//     }  else {
//       if( driversResponse != null ){
//         driversResponse!.drivers.addAll( response.drivers );
//       } else {
//         driversResponse = response;
//       }
//     }
//
//     emit(DriversDownloadListCompleteState(  ));
//   });
// }
///
///
///
class PaginateListview extends StatelessWidget {


  /**
   * ::: easily way to convert List<Model> to List<Widget>  :
   *
   *         List<DriverModel> data = cubit.driversResponse?.drivers??[];
   *          List<Widget> widgets = data.map((e) => DriverMangeItem( e)).toList();
   */
  List<Widget> children;

  /// this fire onChange in case user arrive bottom of screen,
  /// While not fire change in case there isLoadingNextPage next page
  PageinateListviewOnScrollBottomChange  onScrollArriveBottomAndValidToGetNextPageChange;

  EdgeInsets? padding;
  bool isLoadingNextPage;

  /// variable : Private
  final ScrollController _scrollController = ScrollController();



  PaginateListview({
    Key? key,
    required this.children,
    required this.onScrollArriveBottomAndValidToGetNextPageChange,
    required this.isLoadingNextPage ,
    this.padding,
  }) {
    _setProgressViewWidgetToListChildren();
    _setupOnScrollListener();
  }





  void _setupOnScrollListener() {
    _scrollController.addListener( (){
      bool isArriveMaxBottom = _scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100 ;
      if (  isArriveMaxBottom     ) {
        if(   ! isLoadingNextPage ) {
          Log.i("PaginateListview - _setupOnScrollListener() - isLoadingNextPage: $isLoadingNextPage");
          onScrollArriveBottomAndValidToGetNextPageChange(   );
        }
      }
    });

  }

  _setProgressViewWidgetToListChildren(){
    if(isLoadingNextPage ) children.add( ProgressCircleContainer());
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(
      controller: _scrollController,
      primary: false,
      shrinkWrap: true,
      padding: padding,
      children: children,
    ));
  }





}