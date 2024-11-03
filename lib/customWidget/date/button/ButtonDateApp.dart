
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/column/ColumnApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef CalenderSelectCallback = Function(DateTime selectedDateTime, String selectedDate );

enum CalenderTypeApp { dateStartFromToday, birthday }


/**
 *
    --------------------- example birthday shape

    Widget birthday() {
    return CalenderInputFieldApp(
    hint:  "Birthday (optional)".tra(),
    errorBackendJson: stateCubit is RegisterErrorState ? (stateCubit as RegisterErrorState).errors : null ,
    errorBackendKeyJson: "birthday",
    decoration: BoarderHelper.cardView(
    colorLine: ColorResource.textFieldBoarderLineBeforeFocused,
    radiusSize: DimensionResource.cornerTextField,
    colorBackground: ColorResource.textFieldBackground
    ),
    calenderTypeApp: CalenderTypeApp.birthday,
    dateSelected: request.birthdate,
    colorTextTitle: ColorResource.textPrimary,
    colorTextSelected: ColorResource.textPrimary,
    colorTextUnSelected: ColorResource.textLight,
    fontFamily: FontResource.regular,
    fontSize: Figma.h( 16 ),
    width: getTextFieldWidth(),
    height: DimensionResource.textFieldHeight,
    callback: (dateTime, date) {
    var dateShape = DateFormat('yyyy/MM/DD').format(dateTime);
    request.birthdate = dateShape;
    },
    );
    }

 */
class ButtonDateApp extends StatefulWidget {

  String? title;
  String? hint;
  String? dateSelected;
  CalenderTypeApp? calenderTypeApp;
  CalenderSelectCallback callback;
  Color? colorTextUnSelected;
  Color? colorTextSelected;
  Color? colorTextTitle;
  String? fontFamily;
  double? fontSize;
  Decoration? decoration;
  double? height;
  double? width;


  //error
  String? errorBackendKeyJson;
  Map<String, dynamic>? errorBackendJson;
  String? errorMessageBackend;


  ButtonDateApp( {
    this.title,
    this.hint,
    this.dateSelected,
    required this.callback,
    required this.calenderTypeApp,
    this.colorTextSelected,
    this.colorTextUnSelected,
    this.colorTextTitle,
    this.fontFamily,
    this.decoration,
    this.fontSize,
    this.height,
    this.width,


    //error
    this.errorBackendKeyJson,
    this.errorBackendJson,
    this.errorMessageBackend

  }) {
    _setValidatorFromBackend();
  }


  void _setValidatorFromBackend() {
    // print("fastor - _setValidatorFromBackend() - errorBackendKeyJson: $errorBackendKeyJson");
    // print("fastor - _setValidatorFromBackend() - errorBackendJson: $errorBackendJson");

    if (errorBackendKeyJson == null) return;
    if (errorBackendJson == null) return;
    if (errorBackendJson!.containsKey(errorBackendKeyJson!) == false) return;
    errorMessageBackend = errorBackendJson!["" + errorBackendKeyJson!][0];
    // print("fastor - _setValidatorFromBackend() - errorMessageBackend: $errorMessageBackend");
  }


  @override
  _CalenderCustomState createState()  => _CalenderCustomState();

}

class _CalenderCustomState extends State<ButtonDateApp> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ColumnApp( children: [
        widget.title != null ? titleWidget()! : SizedBox(),
        widget.title != null ? SizedBox( height: 20,) : SizedBox(  ), //margin below title
        tapWidgetWithTextField(),
        widget.errorMessageBackend != null ? errorMessageWidget() : SizedBox(),
      ],),
    );
  }


  Widget tapWidgetWithTextField(){
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
      width: widget.width ,
      height: widget.height??49,
      alignment: Alignment.center,
      decoration: widget.decoration ?? BoarderHelper.cardView(
          colorLine: Colors.grey.withOpacity( 0.5),
          radiusSize: 15,
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
        fontSize: widget.fontSize??13,
        fontFamily: widget.fontFamily,
      ),
    );
    //return TextCustomMedium(  "${widget.dateSelected}");
  }

  Widget errorMessageWidget(){
    return Text( "${widget.errorMessageBackend}",
      style: TextStyle(
        color:  Colors.red,// ColorApp.black,
        fontSize: widget.fontSize??13,
        fontFamily: widget.fontFamily,
      ),
    );
  }

  //--------------------------------------------------------- date picker

  Future  showDialogPickerDate( ) async {
    //Log.i( "showDialogPickerDate( )");
    DateTime? selectTime =  null;
    if( widget.calenderTypeApp == CalenderTypeApp.dateStartFromToday   ) {
      selectTime = await _showDialogStartFromToday();
    } else if( widget.calenderTypeApp == CalenderTypeApp.birthday   ) {
      selectTime = await _getDateBirthday();
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

  Future<DateTime?> _getDateBirthday() async {
    DateTime? selectTime =  await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1), //DateTime(DateTime.now().year - 25), // DateTime.now(),
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