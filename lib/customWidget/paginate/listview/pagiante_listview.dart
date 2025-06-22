import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/progress_circle_container.dart';
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
  /// While not fire change in case there isLoadingNextPage next page
  PageinateListviewOnScrollBottomChange  onScrollArriveBottomAndValidToGetNextPageChange;

  /// refresh
  RefreshCallback onRefresh;

  EdgeInsets? padding;
  bool isLoadingNextPage;

  /// variable : Private
  final ScrollController _scrollController = ScrollController();


  PaginateListview({
    Key? key,
    required this.children,
    required this.onScrollArriveBottomAndValidToGetNextPageChange,
    required this.isLoadingNextPage ,
    required this.onRefresh,
    this.padding,
  }) {
    Log.i("PaginateListview() - len: ${children.length}");
    _setProgressViewWidgetToListChildren();
    _setupOnScrollListener();
  }


  void _setupOnScrollListener() {
    _scrollController.addListener( (){
      bool isArriveMaxBottom = _scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100 ;
      if (  isArriveMaxBottom     ) {
        if(   ! isLoadingNextPage ) {
          Log.i("PaginateListview - _setupOnScrollListener() - allow for get next page");
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
    return Expanded(child:
    RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: children.length,
          padding: padding,
          itemBuilder:  (ctx, index ) {
            return children[index];
          }
      ),
    )
    );
  }





}
