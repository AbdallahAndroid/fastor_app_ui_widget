import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/progress_circle_container.dart';
import 'package:fastor_app_ui_widget/customWidget/scrollview/scroll_on_complete_controller.dart';
import 'package:flutter/material.dart';


typedef PageinateListviewOnScrollBottomChange = Function(   );


/// see example at "README.md"
class PaginateListview extends StatelessWidget {


  /**
   * ::: easily way to convert List<Model> to List<Widget>  :
   *
   *         List<DriverModel> data = cubit.driversResponse?.drivers??[];
   *          List<Widget> widgets = data.map((e) => DriverMangeItem( e)).toList();
   */
  List<Widget> children;

  /// this fire onChange in case user arrive bottom of screen,
  /// While not fire change in case there isLoadingNextPage next scaffold
  PageinateListviewOnScrollBottomChange  onScrollArriveBottomAndValidToGetNextPageChange;

  /// refresh
  RefreshCallback onRefresh;

  EdgeInsets? padding;
  bool isLoadingNextPage;

  /// variable : Private
  final ScrollController _scrollController = ScrollController();

  Widget  emptyDataWidget;

  int len = 0;



  PaginateListview({
    Key? key,
    required this.children,
    required this.onScrollArriveBottomAndValidToGetNextPageChange,
    required this.isLoadingNextPage ,
    required this.onRefresh,
    required this.emptyDataWidget,
    this.padding,
  }) {
    len = children.length;
    Log.i("PaginateListview() - len: ${len}");
    _setProgressViewWidgetToListChildren();
    _setupOnScrollComplete();
    _addEmptyDataWidgetInCaseNoData();
  }


  _setProgressViewWidgetToListChildren(){
    if(isLoadingNextPage ) children.add( ProgressCircleContainer());
  }


  _addEmptyDataWidgetInCaseNoData() {
    if( len != 0 ) return;
    double heightScreen = DeviceTools.getHeightGlobal( )??0;

    children.add( emptyDataWidget );

    /// add space bottom to allow scroll to top to fixing the "swipe to refresh"
    // children.add( Container(
    //   width: DeviceTools.getWidthGlobal( ),
    //   constraints: BoxConstraints( minHeight: heightScreen   ),
    //   alignment: Alignment.center,
    //   margin: EdgeInsets.only(top: 160.hr),
    //   color: Colors.grey.withOpacity(0.5 ),
    // ) );
    Log.i("PaginateListview - _addEmptyDataWidgetInCaseNoData()  ");
  }


  void _setupOnScrollComplete() {
    ScrollOnCompleteController(
        scrollController: _scrollController,
        isLoadingNextPage: isLoadingNextPage,
        onCompleteCallback: (){
          onScrollArriveBottomAndValidToGetNextPageChange();
        }
    );
  }

  ///--------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    return Expanded(child: RefreshIndicator(
      onRefresh: onRefresh,
      child:   listBuilderShapeHaveData(),
    )
    );
  }


  listBuilderShapeHaveData() {
    // Log.i("PaginateListview - listBuilderShapeHaveData()  - children.length: ${children.length}");
    return ListView.builder(
        physics: len == 0 ? AlwaysScrollableScrollPhysics() : null ,
        controller: _scrollController,
        itemCount: children.length,
        padding: padding,
        itemBuilder:  (ctx, index ) {
          return children[index];
        }
    );
  }


}

