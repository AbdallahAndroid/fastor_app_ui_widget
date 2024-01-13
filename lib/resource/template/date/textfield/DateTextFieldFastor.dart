
import 'package:fastor_app_ui_widget/resource/resources/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/values/ToolsValidation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef DateTextFieldSelectCallback = Function(String selectedDate);

class DateTextFieldFastor extends StatefulWidget {

  //required
  double width;
  DateTextFieldSelectCallback callback;

  //error
  String? errorBackendKeyJson;
  Map<String, dynamic>? errorBackendJson;
  String? errorMessageBackend;
  Color? colorError;

  //font
  double? fontSize;

  // colors
  Color? colorText;
  Color? colorBackground;

  //hint
  String? hintText;
  Color? hintColor;

  //previous
  String? previousSelectedText;

  //boarder
  double? boarderRadius;
  Color? boarderColor;

  //decoration
  Decoration? decoration;

  //icon
  Color? iconColor;
  double? iconSize;
  Icon? iconCustom;

  //space
  EdgeInsets? paddingContent;

  //constant
  double? height ;
  double? iconMarginRight  ;

  DateTextFieldFastor({

    //size
    required this.width,
    this.iconMarginRight,
    this.height,

    required this.callback,

    //font
    this.fontSize,

    //error
    this.errorBackendKeyJson,
    this.errorBackendJson,
    this.colorError,

    //colors
    this.colorText,
    this.colorBackground,

    //hint
    this.hintText,
    this.hintColor,

    //previous
    this.previousSelectedText,

    //boarder
    this.boarderRadius,
    this.boarderColor,

    //decoration
    this.decoration,

    //icon
    this.iconCustom,
    this.iconSize,
    this.iconColor,

    //space
    this.paddingContent

  }) {
    _setDefaultValues();
    _setValidatorFromBackend();
  }

  @override
  _DateTextFieldFastorState createState() => _DateTextFieldFastorState();

  void _setValidatorFromBackend() {
    // print("fastor - _setValidatorFromBackend() - errorBackendKeyJson: $errorBackendKeyJson");
    // print("fastor - _setValidatorFromBackend() - errorBackendJson: $errorBackendJson");

    if (errorBackendKeyJson == null) return;
    if (errorBackendJson == null) return;
    if (errorBackendJson!.containsKey(errorBackendKeyJson!) == false) return;
    errorMessageBackend = errorBackendJson!["" + errorBackendKeyJson!][0];
    // print("fastor - _setValidatorFromBackend() - errorMessageBackend: $errorMessageBackend");
  }

  void _setDefaultValues() {

    height ??= 43;
    iconMarginRight ??= 16;

    colorError ??= Colors.redAccent;

    fontSize ??= 14;

    colorBackground ??= Colors.white;
    colorText ??= Colors.black;

    hintColor ??= Colors.grey;

    boarderRadius ??= 10;
    boarderColor ??= Colors.grey;

  }
}

class _DateTextFieldFastorState extends State<DateTextFieldFastor> {
  String _selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: contentUI(),
      onTap: () async {
        await showDialogPickerDate();
      },
    );
  }

  Widget contentUI() {
    return Column(
      children: [
        dateWidget(),
        errorTextWidget(),
      ],
    );
  }

  //---------------------------------------------------------- error widget

  Widget errorTextWidget() {
    if (widget.errorMessageBackend == null) {
      return EmptyView.zero();
    }

    var txt = TextFastor("${widget.errorMessageBackend}",
        color: widget.colorError!,
        fontSize: widget.fontSize! - 2
    );

    return Container(
      child: txt,
      width: widget.width,
      alignment: Alignment.topLeft,
    );
  }

  //---------------------------------------------------------- date widget

  Widget dateWidget() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: chooseDecorationNormalOrError(),
      padding: getPaddingContent(),
      child: stackAllContent(),
    );
  }

  EdgeInsets? getPaddingContent(){
    if( widget.paddingContent != null ) return widget.paddingContent;
    return EdgeInsets.all(8);
  }

  Decoration? chooseDecorationNormalOrError() {
    /// pirority : custom decoration
    if( widget.decoration != null ) {
      return widget.decoration;
    }

    /// case error
    if (widget.errorMessageBackend != null) {
      return BoarderHelper.cardView(
          colorBackground: widget.colorBackground!,
          radiusSize: widget.boarderRadius!,
          colorLine: widget.colorError);
    }

    ///case normal
    return BoarderHelper.cardView(
        colorBackground: widget.colorBackground!,
        radiusSize: widget.boarderRadius!,
        colorLine: widget.boarderColor);
  }

  Widget stackAllContent() {
    var hintTextAnIcon = Stack(
      children: [
        EmptyView.empty(widget.width, widget.height!),
        Align(
          child: textHintOrSelected(),
          alignment: Alignment.centerLeft,
        ),
        Positioned(
          child: iconDateWidget(),
          right: widget.iconMarginRight,
          top: 0,
          bottom: 0,
        )
      ],
    );
    return hintTextAnIcon;
  }


  Widget textHintOrSelected() {

    /// case selected by button
    if (ToolsValidation.isValid(_selectedDate)) {
      return showSelectedText();
    } else if( ToolsValidation.isValid( widget.previousSelectedText ) ) {
      return previousSelectedWidget();
    } else {
      return hintText();
    }
  }

  Widget showSelectedText() {
    return TextFastor(
        "$_selectedDate",
        color: widget.colorText,
        fontSize: widget.fontSize
    );
  }

  Widget previousSelectedWidget(){
    return TextFastor(
        widget.previousSelectedText??"",
        color: widget.colorText,
        fontSize: widget.fontSize
    );
  }

  Widget hintText() {
    return TextFastor(
      widget.hintText != null ? widget.hintText! : "Date",
      color: widget.hintColor,
      fontSize: widget.fontSize,
    );
  }

  Widget iconDateWidget() {
    var iconDefault = Icon(
      Icons.date_range,
      size: widget.iconSize ?? 20,
      color: widget.iconColor??Colors.grey,
    );
    return Container(
      child: widget.iconCustom != null ? widget.iconCustom! : iconDefault,
      height: widget.height,
      alignment: Alignment.centerLeft,
    );
  }

  //---------------------------------------------------------

  Future showDialogPickerDate() async {
    //Log.i("showDialogPickerDate( )");

    DateTime? selectTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1975),
        lastDate: DateTime(2100));
    //Log.i("DialogPickDateTime - listener - value: " + selectTime.toString());
    if (selectTime != null) {
      timeSelectedChangeTo(selectTime);
    }
  }

  Future timeSelectedChangeTo(DateTime dateTime) async {
    _selectedDate = DateFormat('yyyy/MM/dd').format(dateTime);
    //Log.i("DialogPickDateTime - listener - edit: " + _selectedDate);

    setState(() {
      widget.callback(_selectedDate);
    });
  }
}
