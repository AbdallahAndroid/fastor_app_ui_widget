
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
import 'package:log_debug/log_debug.dart';
import 'package:flutter/material.dart';

//------------------------------------------------------------------ callback

typedef SpinnerCallBack = void Function( int position, bool isRemoveSelected );

//--------------------------------------------------------------------- class

@Deprecated( "use 'SpinnerView()' instead")
class SpinnerTemplate extends StatefulWidget {

  List<Widget> childers;
  final SpinnerCallBack onSelectPosition;
  Widget hintWidget;
  double width_frame  ;
  double height_frame ;

  SpinnerTemplate(  {
    required  List<Widget> this.childers ,
    required Widget this.hintWidget,
    required double this.width_frame,
    required double this.height_frame,
    required SpinnerCallBack this.onSelectPosition,
  });


  @override
  SpinnerTemplateState createState() {
    return SpinnerTemplateState(
        childers: childers,
    hintWidget: hintWidget,
    width_frame: width_frame,
    height_frame: height_frame,
    onSelectPosition: onSelectPosition
    );
  }


}

class SpinnerTemplateState extends State<SpinnerTemplate> {



  static final  key_position_hint = "-1" ;

  int selected_position = 0;

  List<DropdownMenuItem<String>> listDrop = [];
  List<Widget> childers;
  Widget hintWidget;
  final SpinnerCallBack onSelectPosition;
  double width_frame  ;
  double height_frame ;

  String dropdownValue = '';


  SpinnerTemplateState(  {
    required  List<Widget> this.childers ,
    required Widget this.hintWidget,
    required double this.width_frame,
    required double this.height_frame,
    required SpinnerCallBack this.onSelectPosition,
  }) {
    setDefaultValue();
    fixWidthWithIconSpinner();
  }



  //-------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {

    mapListWidgetToListMenuItem();

    var dropBox = getDropBoxWidget();

    //size
    var material = Material(child: dropBox ) ;
    var sizeBox =  SizedBox( child: material, width: width_frame, height: height_frame );
    return sizeBox;
  }


  Widget getDropBoxWidget(){
    return
      DropdownButton<String>(
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

    //
    onSelectPosition(selected_position, isRemoveSelected);
  }
  //----------------------------------------------------------------------- map data (string)

   void  mapListWidgetToListMenuItem(){       //List<DropdownMenuItem<String>>

    //remove old
    listDrop = [];

    // set hint
    setHintWidget();

     //for
     for( int position = 0 ; position < childers.length; position++ ) {

       Widget wid = childers[position];
       String str = "$position";
       _addToDrop(wid, str );
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