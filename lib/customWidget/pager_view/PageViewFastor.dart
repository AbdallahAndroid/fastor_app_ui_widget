
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/column/ColumnFastor.dart';
import 'package:flutter/material.dart';

class PageViewFastor extends StatefulWidget {
//constructor

  List<Widget> children;
  double width;
  double height;
  ValueChanged<int>? onChangePage;
  Color colorIndicatorOn;
  Color colorIndicatorOff;

  PageController? pageViewController;


  PageViewFastor(
      {
        required List<Widget> this.children,
        required double this.width,
        required double this.height,
        required Color this.colorIndicatorOn,
        required Color this.colorIndicatorOff,
        this.pageViewController,
        ValueChanged<int>? onChangePage}) {
    this.onChangePage = onChangePage;
    this.pageViewController = PageController(initialPage: 0);
  }

  @override
  PageViewFastorState createState() {
    return PageViewFastorState(
        );
  }
}

class PageViewFastorState extends State<PageViewFastor> {
  //-------------------------------------------------------------- variable and constructor

  //constructor
  int counterPage = 0;

  //controller
  int _currentPage = 0;



  //-------------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    initValues();
    return Directionality(textDirection: LangFastor.getTextDirection(), child: getContent() );
  }

  Widget getContent() {
    return ColumnFastor( children: [
      page_adapter(),
      row_indecator()
    ]
    );
  }

  void initValues() {
    counterPage = widget.children.length;
    //Log.i( "initValues() - isArabic: " +  LanguageTools.isArabic( context).toString()) ;
  }

  //------------------------------------------------------------------- page adapter

  Widget page_adapter() {
    var page = PageView(

      /**
       * arabic make reverse
       */
      // reverse: LanguageTools.isArabic( context),

      physics: const ClampingScrollPhysics(),
      controller: widget.pageViewController,
      onPageChanged: (int page) {
        // Log.i("page_adapter() - PageView - onPageChanged: " + page.toString());
        updatePageSelected( page );

      },

      children: widget.children,
    );

    return Container(child: page, height: widget.height, width: widget.width,);
  }


  updatePageSelected(int newPage) {
    // Log.i("updatePageSelected() - newPage: $newPage");
    //change state
    setState(() {
      _currentPage = newPage;
    });

    //call back
    if(widget.onChangePage != null ) {
      widget.onChangePage!( newPage );
    }
  }
  //------------------------------------------------------------------- indecator points

  Widget row_indecator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }

  //--------------------------------------------------------------- indicator by direction

  List<Widget> _buildPageIndicator() {
    return _buildIndicatorEnglish();
  }

  List<Widget> _buildIndicatorEnglish() {
    List<Widget> list = [];
    for (int i = 0; i < counterPage; i++) {
      bool statusActive = i == _currentPage;
      list.add(_itemIndicatorWidget(statusActive, i ));
    }
    return list;
  }

  //------------------------------------------------------------------ view of indecator

  Widget _itemIndicatorWidget(bool isActive, int position) {

    Color colorChoose =  isActive ? widget.colorIndicatorOn : widget.colorIndicatorOff;

    var animatedWidget =  AnimatedContainer(
      duration: Duration(milliseconds: 150),
      // margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: colorChoose,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

    var paddingClick = Container(
      child: animatedWidget,
      padding: EdgeInsets.all(  8),
      color: Colors.transparent,
    );

    return GestureDetector(
      child: paddingClick,
      onTap: () async {
        await widget.pageViewController!.animateToPage(  position,
            duration: Duration(milliseconds: 300 ),
            curve:  Curves.easeInOut
        );

        //updatePageSelected( position);
      },
    );
  }


}
