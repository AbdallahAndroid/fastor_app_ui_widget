

import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';

import 'package:flutter/material.dart';

//------------------------------------------------------------------ callback

typedef SpinnerViewCallBack = void Function( int position, bool isRemoveSelected );

//--------------------------------------------------------------------- class

class SpinnerView extends StatefulWidget {

  List<Widget> childers;
  final SpinnerViewCallBack onSelectPosition;
  ValueChanged<SpinnerViewState>? changeState;
  Widget hintWidget;
  double width_frame  ;
  double height_frame ;

  SpinnerView (  {
    required  List<Widget> this.childers ,
    required Widget this.hintWidget,
    required double this.width_frame,
    required double this.height_frame,
    required SpinnerViewCallBack this.onSelectPosition,
    ValueChanged<SpinnerViewState>? this.changeState
  });


  @override
  SpinnerViewState createState() {
    var state =  SpinnerViewState  (
        childers: childers,
        hintWidget: hintWidget,
        width_frame: width_frame,
        height_frame: height_frame,
        onSelectPosition: onSelectPosition
    );
    if(changeState != null ) changeState!(state);
    return state;
  }




}

class SpinnerViewState extends State<SpinnerView> {

  //------------------------------------------------------------------ variable

  static final  key_position_hint = "-1" ;

  int selected_position = 0;

  List<DropdownMenuItem<String>> listDrop = [];
  List<Widget> childers;
  Widget hintWidget;
  final SpinnerViewCallBack onSelectPosition;
  double width_frame  ;
  double height_frame ;

  String dropdownValue = '';

  //view
  // DropdownButton? drop;

  SpinnerViewState(  {
    required  List<Widget> this.childers ,
    required Widget this.hintWidget,
    required double this.width_frame,
    required double this.height_frame,
    required SpinnerViewCallBack this.onSelectPosition,
  }) {
    setDefaultValue();
    fixWidthWithIconSpinner();
  }

  //------------------------------------------------------------------ set position


  void setPosition(int newPosition) {

    setState(() {
      String keyDefaultPosition = "$newPosition";
      dropdownValue = keyDefaultPosition;
      selected_position = newPosition;
    });


    //callback
    onSelectPosition(selected_position, false);
  }

  void clearSelected() {

    setState(() {
      String keyDefaultPosition = key_position_hint;
      dropdownValue = keyDefaultPosition;
      selected_position = int.parse( key_position_hint);
    });


    //callback
    onSelectPosition(selected_position, true);
  }

  //-------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {

    mapListWidgetToUnSelectedMenu();
    var dropBox = getDropBoxWidget();

    //size
    var material = Material(child: dropBox ) ;
    var sizeBox =  SizedBox( child: material, width: width_frame, height: height_frame );
    return sizeBox;
  }


  Widget getDropBoxWidget(){
    var  drop =  DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      dropdownColor: DSColor.spinner_background,
      focusColor: DSColor.spinner_background,

      underline: Container(
        height: 2,
        color: DSColor.spinner_underline,
      ),


      //change
      onChanged: (String? newValue) {
        // Log.i( "getDropBoxWidget() - change: " + newValue.toString() );
        updateSelected(newValue??"0");
      },

      items: listDrop, // mapListWidgetToListMenuItem(),

    );

    return drop;
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
    onSelectPosition(selected_position, isRemoveSelected);
  }
  //----------------------------------------------------------------------- map data (string)

  void  mapListWidgetToUnSelectedMenu(){       //List<DropdownMenuItem<String>>
    //Log.i( "mapListWidgetToUnSelectedMenu()");
    //remove old
    listDrop = [];

    // set hint
    setHintWidget();

    //for
    for( int position = 0 ; position < childers.length; position++ ) {

      Widget wid = childers[position];
      String key = "$position";
      _addToDrop(wid, key );
    }

    //  return listDrop;
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

  //----------------------------------------------------------------------- init values

  void setDefaultValue() {
    //  Log.i("setDefaultValue()");
    /**
        "There should be exactly one item with [DropdownButton]'s value: One. \nEither zero or 2 or more [DropdownMenuItem]s were detected with the same value"
     */
    dropdownValue = key_position_hint;// listChildWidget[0];
  }

  void fixWidthWithIconSpinner() {
    /**
     * the icon spinner with is 24 px, so need to decrease the width of frame
     */
    final widthArrow = 30 ;
    width_frame = width_frame +widthArrow;
  }

  void setHintWidget() {
    // var hintWid = TextTemplate.t( "hint here"  , color: Colors.yellow);
    _addToDrop( hintWidget, key_position_hint );
  }


}