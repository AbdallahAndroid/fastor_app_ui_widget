



import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';

import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
//------------------------------------------------------------------ callback

typedef SpinnerViewCallBack = void Function( int position, bool isRemoveSelected );

//--------------------------------------------------------------------- class


class SpinnerView extends StatefulWidget {

  static final  key_position_hint = "-1" ;

  List<Widget> childers;
  Widget? iconDropdown;
  Decoration? decorationOutlineDropdown;

  Color? colorDropdownMenu;
  Color? colorDropdownButtonOutline;
  // Color? colorDropdownButtonBackground;
  Color? colorDropdownTextBackground;

  Color? underlineColor;
  SpinnerViewCallBack onSelectPosition;

  //text
  TextStyle? textStyleItemDropdown;

  //hint
  Widget hintWidget;

  //previous
  int? previousPosition;

  //size
  double width_frame  ;
  double height_frame ;
  double iconSize;
  double? radiusButton;

  //error
  String? errorBackendKeyJson;
  Map<String, dynamic>? errorBackendJson;
  // Color? errorColor ;
  Decoration? errorOutlineDropdownDropdown;
  String? errorMessageBackend;
  TextStyle? errorTextStyle;

  //local variable
  int selected_position = 0;
  List<DropdownMenuItem<String>> listDrop = [];
  String dropdownValue = '';


  SpinnerView (  {
    required  List<Widget> this.childers ,
    required Widget this.hintWidget,
    required double this.width_frame,
    required double this.height_frame,
    required double this.iconSize,
    required SpinnerViewCallBack this.onSelectPosition,
    this.radiusButton,
    this.decorationOutlineDropdown,
    this.iconDropdown,
    this.textStyleItemDropdown,
    this.colorDropdownMenu,
    this.colorDropdownButtonOutline,
    // this.colorDropdownButtonBackground,
    this.colorDropdownTextBackground,
    this.underlineColor,
    this.previousPosition,

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

    // print("fastor - SpinnerView - constructor() previousPosition: $previousPosition");
    if( previousPosition != null ){
      // previousPosition ??= int.parse( SpinnerView.key_position_hint);
      setPosition( previousPosition!);
    }

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
    iconDropdown ??= Icon(Icons.arrow_drop_down, size: iconSize );

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

    //positon dropdown
    /**
        "There should be exactly one item with [DropdownButton]'s value: One. \nEither zero or 2 or more [DropdownMenuItem]s were detected with the same value"
     */
    // dropdownValue = SpinnerView.key_position_hint;
  }


  void fixWidthWithIconSpinner() {
    /**
     * the icon spinner with is 24 px, so need to decrease the width of frame
     */
    final widthArrow = 30 ;
    width_frame = width_frame +widthArrow;
  }

  //------------------------------------------------------------------ set position


  void setPosition(int newPosition) {
    String keyDefaultPosition = "$newPosition";
    dropdownValue = keyDefaultPosition;
    selected_position = newPosition;
  }

  void clearSelected() {
    String keyDefaultPosition = SpinnerView.key_position_hint;
    dropdownValue = keyDefaultPosition;
    selected_position = int.parse( SpinnerView.key_position_hint);
  }

}

class SpinnerViewState extends State<SpinnerView> {

  //-------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {

    mapListWidgetToUnSelectedMenu();

    return Column( children: [
      stackDropDownAndIcon(),
      errorTextWidget()
    ],);
  }

  //----------------------------------------------------------- stack icon and dropwond

  Widget stackDropDownAndIcon(){

    double marginTopIcon = widget.iconSize  / 4;

    return Stack( children: [
      dropboxAndBoarder(),
      Positioned(  child: widget.iconDropdown!, right: 0, top: marginTopIcon,)
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

  //---------------------------------------------------------- decoration and resize

  Widget dropboxAndBoarder(){
    var dropBox = getDropBoxWidget();

    //decoration
    var containerDecoration = Container( child:  dropBox,
        // color: Colors.green,
        width: widget.width_frame  ,
        height: widget.height_frame,
        decoration: chooseDecorationNormalOrError()
    );
    return containerDecoration;
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
        colorBackground:  Colors.transparent,
        colorLine: widget.colorDropdownButtonOutline ?? Colors.transparent,
        radiusSize: widget.radiusButton??0
    ) ;
  }

//---------------------------------------------------------- dropdown

  Widget getDropBoxWidget(){
    // print("fastor - SpinnerView - getDropBoxWidget() dropdownValue: ${widget.dropdownValue}");
    if( ToolsValidation.isEmpty( widget.dropdownValue) ) {
      widget.dropdownValue = SpinnerView.key_position_hint;
    }
    return DropdownButton<String>(
      value: widget.dropdownValue,
      // icon: widget.iconDropdown,
      // iconSize: 24, //widget.iconSize,
      iconSize: 0, //hide icon

      elevation: 16,
      dropdownColor: widget.colorDropdownMenu,
      focusColor: widget.colorDropdownMenu,
      style: widget.textStyleItemDropdown??TextStyle(
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

      items: widget.listDrop, // mapListWidgetToListMenuItem(),

    );
  }

  //-------------------------------------------------------------------------- update

  void updateSelected(String newValue ){

    setState(() {
      widget.dropdownValue  = newValue;
      widget.selected_position = int.parse(widget.dropdownValue);
      startCallback( newValue );

    });
  }

  void startCallback(String newValue) {
    // is remove selected
    // var selectKey = SpinnerView.key_position_hint.toString();
    bool isRemoveSelected   =   newValue == SpinnerView.key_position_hint;

    //callback
    widget.onSelectPosition(widget.selected_position, isRemoveSelected);
  }
  //----------------------------------------------------------------------- map data (string)

  void  mapListWidgetToUnSelectedMenu(){       //List<DropdownMenuItem<String>>
    //Log.i( "mapListWidgetToUnSelectedMenu()");
    //remove old
    widget.listDrop = [];

    // set hint
    setHintWidget();

    //for
    for( int position = 0 ; position < widget.childers.length; position++ ) {

      Widget wid = widget.childers[position];
      String key = "$position";
      _addToDrop(wid, key );
    }

    //  return widget.listDrop;
  }

  void setHintWidget() {
    var removeSpace = 60;
    var hintTextAnIcon = Stack( children: [
      EmptyView.empty( widget.width_frame - removeSpace  , widget.height_frame ),
      Align( child: widget.hintWidget!, alignment: Alignment.centerLeft,),
      Positioned( child: EmptyView.zero(), right: 0 )
    ],);
    _addToDrop( hintTextAnIcon, SpinnerView.key_position_hint );
  }


  void _addToDrop(Widget wid, String position ){
    //drop
    DropdownMenuItem<String> drop = DropdownMenuItem<String>(
      // key: _formKey,
      value: position ,
      child: wid,
    );
    widget.listDrop.add( drop );

  }


}