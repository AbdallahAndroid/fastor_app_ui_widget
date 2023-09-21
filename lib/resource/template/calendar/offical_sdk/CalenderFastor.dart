
import 'package:fastor_app_ui_widget/resource/resources/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/resource/template/column/ColumnFastor.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/log/Log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef CalenderSelectCallback = Function(DateTime selectedDateTime, String selectedDate );

enum CalenderTypeFastor { dateStartFromToday, birthday }

class CalenderFastor extends StatefulWidget {

  String? title;
  String? hint;
  String? dateSelected;
  CalenderTypeFastor? calenderTypeFastor;
  CalenderSelectCallback callback;
  Color? colorTextUnSelected;
  Color? colorTextSelected;
  Color? colorTextTitle;
  String? fontFamily;
  double? fontSize;
  Decoration? decoration;

  CalenderFastor( {
    this.title,
    this.hint,
    this.dateSelected,
    required this.callback,
    required this.calenderTypeFastor,
    this.colorTextSelected,
    this.colorTextUnSelected,
    this.colorTextTitle,
    this.fontFamily,
    this.decoration
});

  @override
  _CalenderCustomState createState()  => _CalenderCustomState();

}

class _CalenderCustomState extends State<CalenderFastor> {

  @override
  Widget build(BuildContext context) {

    var column = ColumnFastor( children: [
      widget.title != null ? titleWidget()! : SizedBox(),
      widget.title != null ? SizedBox( height: 20,) : SizedBox(  ), //margin below title
      tapWidget()
    ],);

    return Container(
      child: column,
    );
  }


  Widget tapWidget(){
    return GestureDetector(
      child: fieldWidget(),
      onTap: () async {
        Log.i("calender tab");
        showDialogPickerDate();
      },
    );
  }

  Widget fieldWidget(){
    return Container(
      child: hintOrTextSelectedWidget(),
      height: 49,
      alignment: Alignment.center,
      decoration: widget.decoration ?? BoarderHelper.cardView(
          colorLine: Colors.grey.withOpacity( 0.5),
          radiusSize: 3,
          colorBackground: Colors.white
      ),
    );
  }

  //------------------------------------------------------ text title

  Widget titleWidget(){
    return Text( widget.title??"Select Date",
      style: TextStyle(
        color: widget.colorTextTitle??Colors.black,  //Colors.black
        fontSize: widget.fontSize??13,
        fontFamily: widget.fontFamily, //ProjectFonts.DarkerGrotesque_Bold_700
      ),
    );
  }

  //------------------------------------------------------ text date

  Widget hintOrTextSelectedWidget(){
    if( widget.dateSelected == null ) {
      return hintWidget();
    } else {
      return textDateSelected();
    }
  }

  Widget hintWidget(){
    return Text( widget.hint??"Select Date",
      style: TextStyle(
          color: widget.colorTextUnSelected??Colors.grey,  //Colors.black
          fontSize: widget.fontSize??13,
          fontFamily: widget.fontFamily, //ProjectFonts.DarkerGrotesque_Bold_700
      ),
    );
    //return TextCustomMedium(  "Select Date");
  }

  Widget textDateSelected(){
    return Text( "${widget.dateSelected}",
      style: TextStyle(
          color: widget.colorTextSelected??Colors.black,// ColorApp.black,
          fontSize: 13,
          fontFamily: widget.fontFamily,
      ),
    );
    //return TextCustomMedium(  "${widget.dateSelected}");
  }


  //--------------------------------------------------------- date picker

  Future  showDialogPickerDate( ) async {
    //Log.i( "showDialogPickerDate( )");
    DateTime? selectTime =  null;
    if( widget.calenderTypeFastor == CalenderTypeFastor.dateStartFromToday   ) {
      selectTime = await _showDialogStartFromToday();
    } else if( widget.calenderTypeFastor == CalenderTypeFastor.birthday   ) {
      selectTime = await _showDialogBirthday();
    }

    // Log.i( "DialogPickDateTime - listener - value: " + selectTime.toString() );
    if(selectTime != null ) {
      updateUi(selectTime );
      changeToBackendFormatShapeThenCallback(selectTime);
    }

  }


  Future<DateTime?> _showDialogStartFromToday() async {
    DateTime? selectTime =  await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 100)
    );
    return selectTime;
  }

  Future<DateTime?> _showDialogBirthday() async {
    DateTime? selectTime =  await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //DateTime(DateTime.now().year - 25),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    return selectTime;
  }

  /**
   * Thu, Aug 17, 2023
   */
  Future updateUi(DateTime dateTime) async {

    final formatter = DateFormat('E, MMM d, y');
    widget.dateSelected = formatter.format(dateTime);
    // Log.i( "DialogPickDateTime - listener - edit: " + widget.dateSelected.toString() );

    if(widget.dateSelected == null ) return;

    setState(() {

    });
  }


  void changeToBackendFormatShapeThenCallback(DateTime dateTime) {
    var dateShape_ddmmyyyy = DateFormat('dd/MM/yyyy').format(dateTime );
    widget.callback( dateTime, dateShape_ddmmyyyy);
    //Log.i( "DialogPickDateTime - listener - backendResult: " + backendResult.toString() );
  }

}