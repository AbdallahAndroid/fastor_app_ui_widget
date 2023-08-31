



import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';

import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
//------------------------------------------------------------------ callback

typedef SpinnerViewCallBack = void Function( int position, bool isRemoveSelected );

//--------------------------------------------------------------------- class

class SpinnerView extends StatefulWidget {

  List<Widget> childers;
  Widget? iconDropdown;
  Decoration? decorationOutlineDropdown;

  Color? colorDropdownMenu;
  Color? colorDropdownButtonOutline;
  Color? colorDropdownButtonBackground;
  Color? colorDropdownTextBackground;

  Color? underlineColor;
  SpinnerViewCallBack onSelectPosition;
  Widget hintWidget;

  //size
  double width_frame  ;
  double height_frame ;
  double? radiusButton;

  //error
  String? errorBackendKeyJson;
  Map<String, dynamic>? errorBackendJson;
  // Color? errorColor ;
  Decoration? errorOutlineDropdownDropdown;
  String? errorMessageBackend;
  TextStyle? errorTextStyle;

  SpinnerView (  {
    required  List<Widget> this.childers ,
    required Widget this.hintWidget,
    required double this.width_frame,
    required double this.height_frame,
    required SpinnerViewCallBack this.onSelectPosition,
    this.radiusButton,
    this.decorationOutlineDropdown,
    this.iconDropdown,
    this.colorDropdownMenu,
    this.colorDropdownButtonOutline,
    this.colorDropdownButtonBackground,
    this.colorDropdownTextBackground,
    this.underlineColor,

    //error
    this.errorBackendKeyJson,
    this.errorBackendJson,
    // this.errorColor,
    this.errorTextStyle,
    this.errorOutlineDropdownDropdown,

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


  bool isHaveError(){
    if( errorBackendKeyJson == null ) return false ;
    if( errorBackendJson == null ) return false ;
    if( errorBackendJson!.containsKey(errorBackendKeyJson!) == false ) return false ;
    return true;
  }


  void setDefaultValue() {
    //  Log.i("setDefaultValue()");

    //icon triangle
    iconDropdown ??= Icon(Icons.arrow_drop_down);

    underlineColor ??= Colors.transparent;

    //error
    // errorColor ??= Colors.red;
    errorTextStyle = const TextStyle(
        color: Colors.redAccent ,
        fontWeight: FontWeight.w500,
        fontSize: 14
    );

    errorOutlineDropdownDropdown ??= BoarderHelper.cardView(
        colorBackground: Colors.transparent,
        radiusSize: 8,
        colorLine: Colors.redAccent
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
    var container = Container( child:  dropBox,
        // color: Colors.green,
        decoration: chooseDecorationNormalOrError()
    );

    //size
    // var material = Material(child: container ) ;
    var sizeBox =  SizedBox(
        child: container,
        width: widget.width_frame,
        height: widget.height_frame );
    return sizeBox;
  }


  Decoration? chooseDecorationNormalOrError(){
    // print("fastor - chooseDecorationNormalOrError() - errorMessageBackend:  ${widget.errorMessageBackend}" );

    //case : have error
    if( widget.isHaveError() ) {
      return widget.errorOutlineDropdownDropdown;
    }

    //case : user need to  draw design outlineDropdown
    if( widget.decorationOutlineDropdown != null ) {
      return widget.decorationOutlineDropdown;
    }

    //case : default no outline
    return BoarderHelper.cardView(
      colorBackground: widget.colorDropdownButtonBackground ?? Colors.transparent,
      colorLine: widget.colorDropdownButtonOutline ?? Colors.transparent,
      radiusSize: widget.radiusButton??0
    ) ;
  }


  Widget getDropBoxWidget(){
    return DropdownButton<String>(
      value: dropdownValue,
      icon: widget.iconDropdown,
      iconSize: 24,
      elevation: 16,
      dropdownColor: widget.colorDropdownMenu,
      focusColor: widget.colorDropdownMenu,
      style: TextStyle(
        backgroundColor: widget.colorDropdownTextBackground, // Set the background color here
      ),
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
    var removeSpace = 60;
    var hintTextAnIcon = Stack( children: [
      EmptyView.empty( widget.width_frame - removeSpace  , widget.height_frame ),
      Align( child: widget.hintWidget!, alignment: Alignment.centerLeft,),
      Positioned( child: EmptyView.zero(), right: 0 )
    ],);
    _addToDrop( hintTextAnIcon, key_position_hint );
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