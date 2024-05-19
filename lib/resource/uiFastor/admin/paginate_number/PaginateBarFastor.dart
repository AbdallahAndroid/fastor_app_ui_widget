


import 'package:fastor_app_ui_widget/resource/uiFastor/admin/paginate_number/widget/ButtonBarPaginate.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/admin/paginate_number/widget/TotalInformationBarPaginate.dart';
import 'package:flutter/material.dart';

typedef PaginateBarChange  = Function(int page );

class PaginateBarFastor extends StatefulWidget{


  PaginateBarChange paginateNumberChange;
  int currentPage  ;
 //example pages: 1,  Current page selected
  int itemTotal ;       //pages: 10 , How many page will be avaliable to download from backend
  int limitPerPage ; //example paginator: 10, limit per every page
  int  maxPage = 0;
  bool progress;

  // colors
  Color colorPrimary;
  Color colorSecondary;

  PaginateBarFastor(  {
    required this.currentPage,
    required this.itemTotal,
    required this.limitPerPage,
    required this.progress,
    required this.paginateNumberChange,
    required this.colorPrimary,
    required this.colorSecondary

}){

     _calculateMaxPage();
    // String data =    '{ currentPage: $currentPage, itemTotal: $itemTotal, limitPerPage: $limitPerPage, maxPage: $maxPage, progress: $progress}';
    // Log.i("PaginateNumberWidget - constructor - data: $data");
  }



  @override
  PaginateBarState createState() {

    return PaginateBarState();
  }

  static double getHeightFrame(BuildContext context){

    if( DeviceTools.isPortrait( context ) ) {
      return 115.0; // 200.0;
    }
    return 105.0;
  }

   _calculateMaxPage() {
    //    this.maxPage ??=  1000000; //pages: 999, means if there is 1000 page it will show to only page 999 maxPage;
    if( itemTotal == 0 ) {
      maxPage = 0;
      return;
    }

    double pages =  itemTotal / limitPerPage;
    int valueNoFraction = removeFraction(pages);
    if( hasFraction(pages) ) {
      maxPage = valueNoFraction + 1;
    } else {
      maxPage = valueNoFraction;
    }

  }

  bool hasFraction(double value) {
    return value % 1 != 0;
  }
  int removeFraction(double value) {
    double noFraction =  value.toInt().toDouble();
    return noFraction.toInt();
  }


}

class PaginateBarState extends State<PaginateBarFastor> {

  //numbers of page
  List<Widget> listNumberWidget = [];
  int  recordTotal = 0; //example pages: 100,  the totalBar database record


  //go to by search text
  int pageGoTo = 0;
  late TextEditingController tf_goto_controller  = TextEditingController();

  String? msgError;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    tf_goto_controller.text = "" ;
    return getDirection();
  }


  Widget getDirection() {
    return   Directionality(
      textDirection:   LangFastor.getTextDirection(),
      child:   Builder(
        builder: (BuildContext context) {
          return   MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: contentUI(),
          );
        },
      ),
    );
  }


  Widget contentUI(){
    return Container(
        child: widget.progress ?  progressView() : barContentUI(),
        color:widget.colorPrimary ,// ColorProject.primaryTransparentMedium,
      height: PaginateBarFastor.getHeightFrame(context),
        // padding: EdgeInsets.symmetric(vertical: DSDimen.space_level_4 )
    );
  }

  //--------------------------------------------------------------------- progress view

  Widget progressView(){

    var prg = ProgressCircleFastor( color: widget.colorSecondary,);

    return Container( child: prg,
      width: DeviceTools.getWidth(context),
      alignment: Alignment.center,
        // color: ColorProject.primaryTransparentMedium,

      // padding: EdgeInsets.symmetric(vertical: DSDimen.space_level_4 )
    );
  }

  //--------------------------------------------------------------------- tabs view


  Widget barContentUI(){
    return ColumnFastor(children: [
      barTabButtonAndSearchBarResponsiveBetweenMobileAndDesktop(),
      if(msgError  != null ) messageErrorWidget()
    ]);
  }


  Widget barTabButtonAndSearchBarResponsiveBetweenMobileAndDesktop(){
    return   PortraitToLandscapeUtilsResponsiveFastor.convertChildrenFromPortraitVerticalToBeLandscapeHorizontal(
        context: context,
        isPutInsideScrollbar: false,
        children: [
          buttonBarPaginate(),
          totalBarPaginate(),
    ]);
  }


  Widget messageErrorWidget(){
    var txt =  TextFastor( msgError??"",
      color: Colors.red,
      fontSize: 10,
    );
    return Container(
      width: DeviceTools.getWidth(context),
      alignment: Alignment.center,
      child: txt,
    );
  }


}
