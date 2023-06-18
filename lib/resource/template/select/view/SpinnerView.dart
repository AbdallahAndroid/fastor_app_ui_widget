

import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';

import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';

import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';

//------------------------------------------------------------------ callback

typedef SpinnerViewCallBack = void Function( int position, bool isRemoveSelected );

//--------------------------------------------------------------------- class

class SpinnerView extends StatefulWidget {

  List<Widget> childers;
  Widget? iconDropdown;
  Decoration? decorationOutlineDropdown;
  Color? dropdownColor;
  Color? underlineColor;
  SpinnerViewCallBack onSelectPosition;
  Widget hintWidget;
  double width_frame  ;
  double height_frame ;

  //error
  String? errorBackendKeyJson;
  Map<String, dynamic>? errorBackendJson;
  // Color? errorColor ;
  String? errorMessageBackend;
  TextStyle? errorTextStyle;

  SpinnerView (  {
    required  List<Widget> this.childers ,
    required Widget this.hintWidget,
    required double this.width_frame,
    required double this.height_frame,
    required SpinnerViewCallBack this.onSelectPosition,
    this.decorationOutlineDropdown,
    this.iconDropdown,
    this.dropdownColor,
    this.underlineColor,

    //error
    this.errorBackendKeyJson,
    this.errorBackendJson,
    // this.errorColor,
    this.errorTextStyle

  }){
    setDefaultValue();
    fixWidthWithIconSpinner();
    _setValidatorFromBackend();
  }


  @override
  SpinnerViewState createState() {
    return SpinnerViewState();
  }

  //--------------------------------------------------------------- set default values

  void _setValidatorFromBackend() {
    // print("fastor - _setValidatorFromBackend() - errorBackendKeyJson: $errorBackendKeyJson");
    // print("fastor - _setValidatorFromBackend() - errorBackendJson: $errorBackendJson");
    if( errorBackendKeyJson == null ) return;
    if( errorBackendJson == null ) return;
    if( errorBackendJson!.containsKey(errorBackendKeyJson!) == false ) return;
    errorMessageBackend =  errorBackendJson!["" + errorBackendKeyJson!][0];
    // print("fastor - _setValidatorFromBackend() - errorMessageBackend: $errorMessageBackend");
  }

  void setDefaultValue() {
    //  Log.i("setDefaultValue()");

    //icon triangle
    iconDropdown ??= Icon(Icons.arrow_drop_down);

    underlineColor ??= Colors.transparent;

    //error
    // errorColor ??= Colors.red;
    errorTextStyle = const TextStyle(
        color: Colors.red ,
        fontSize: 14
    );
  }



  void fixWidthWithIconSpinner() {
    /**
     * the icon spinner with is 24 px, so need to decrease the width of frame
     */
    final widthArrow = 30 ;
    width_frame = width_frame +widthArrow;
  }

}

class SpinnerViewState extends State<SpinnerView> {

  //------------------------------------------------------------------ variable

  static final  key_position_hint = "-1" ;
  int selected_position = 0;
  List<DropdownMenuItem<String>> listDrop = [];
  String dropdownValue = '';

  SpinnerViewState(  ) {
    /**
        "There should be exactly one item with [DropdownButton]'s value: One. \nEither zero or 2 or more [DropdownMenuItem]s were detected with the same value"
     */
    dropdownValue = key_position_hint;// listChildWidget[0];
  }

  //------------------------------------------------------------------ set position


  void setPosition(int newPosition) {

    setState(() {
      String keyDefaultPosition = "$newPosition";
      dropdownValue = keyDefaultPosition;
      selected_position = newPosition;
    });


    //callback
    widget.onSelectPosition(selected_position, false);
  }

  void clearSelected() {

    setState(() {
      String keyDefaultPosition = key_position_hint;
      dropdownValue = keyDefaultPosition;
      selected_position = int.parse( key_position_hint);
    });


    //callback
    widget.onSelectPosition(selected_position, true);
  }

  //-------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {

    mapListWidgetToUnSelectedMenu();

    return Column( children: [
      dropboxSized(),
      errorTextWidget()
    ],);
  }

  //---------------------------------------------------------- error widget

  Widget errorTextWidget() {
    if( widget.errorMessageBackend == null  ) {
      return EmptyView.zero();
    }

    var txt =  Text(
        "${widget.errorMessageBackend}",
        style: widget.errorTextStyle
    );

    return Container(
      child: txt,
      width: widget.width_frame,
      alignment: Alignment.topLeft,
    );
  }

  //---------------------------------------------------------- drop down

  Widget dropboxSized(){
    var dropBox = getDropBoxWidget();

    //decoration
    var container = Container( child:  dropBox, decoration: widget.decorationOutlineDropdown ,);

    //size
    var material = Material(child: container ) ;
    var sizeBox =  SizedBox( child: material,
        width: widget.width_frame,
        height: widget.height_frame );
    return sizeBox;
  }


  Widget getDropBoxWidget(){
    return DropdownButton<String>(
      value: dropdownValue,
      icon: widget.iconDropdown,
      iconSize: 24,
      elevation: 16,
      dropdownColor: widget.dropdownColor,
      focusColor: widget.dropdownColor,

      underline: Container(
        height: 2,
        color: widget.underlineColor!,
      ),


      //change
      onChanged: (String? newValue) {
        // Log.i( "getDropBoxWidget() - change: " + newValue.toString() );
        updateSelected(newValue??"0");
      },

      items: listDrop, // mapListWidgetToListMenuItem(),

    );
  }

  //-------------------------------------------------------------------------- update

  void updateSelected(String newValue ){

    setState(() {
      dropdownValue  = newValue;
      selected_position = int.parse(dropdownValue);
      startCallback( newValue );

    });
  }

  void startCallback(String newValue) {
    // is remove selected
    // var selectKey = key_position_hint.toString();
    bool isRemoveSelected   =   newValue == key_position_hint;

    //callback
    widget.onSelectPosition(selected_position, isRemoveSelected);
  }
  //----------------------------------------------------------------------- map data (string)

  void  mapListWidgetToUnSelectedMenu(){       //List<DropdownMenuItem<String>>
    //Log.i( "mapListWidgetToUnSelectedMenu()");
    //remove old
    listDrop = [];

    // set hint
    setHintWidget();

    //for
    for( int position = 0 ; position < widget.childers.length; position++ ) {

      Widget wid = widget.childers[position];
      String key = "$position";
      _addToDrop(wid, key );
    }

    //  return listDrop;
  }

  void setHintWidget() {
    // var hintWid = TextTemplate.t( "hint here"  , color: Colors.yellow);
    _addToDrop( widget.hintWidget, key_position_hint );
  }


  void _addToDrop(Widget wid, String position ){
    //drop
    DropdownMenuItem<String> drop = DropdownMenuItem<String>(
      // key: _formKey,
      value: position ,
      child: wid,
    );
    listDrop.add( drop );

  }


}