// class DropdownFastor e
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/template/select/fastor/widget/DropdownContent.dart';
import 'package:fastor_app_ui_widget/resource/template/select/fastor/widget/PreviousSelected.dart';
import 'package:flutter/material.dart';

typedef DropDownSelectChangeListenerTest = Function(String name, int poistion );
typedef DropDownRemoveSelectedListener = Function( );



class DropdownFastor extends StatefulWidget {

  static double defaultHeight = 40;

  //required
  List<String> names;
  DropDownSelectChangeListenerTest listener;

  //remove
  DropDownRemoveSelectedListener onRemoveSelected;
  // bool? removeSelected;

  //size
  double? height_frame ;
  double width;
  double iconSize;
  double? radiusButton;

  // hint
  String? hintText;
  Widget? hintWidget;
  Color? colorHintText;

  //text
  TextStyle? textStyleItemDropdown;
  TextAlign? textAlignItemDropdown;

  //previous
  int? previousPosition;
  String? previousSelectedText;
  Color? colorPreviousSelected;

  //spin
  double? spinnerTriangleWidth;

  Color? colorItemTextSelected;

  //colors
  Color? colorItemText;
  Color? colorDropdownButtonOutline;
  // Color? colorDropdownButtonBackground;
  Color? colorDropdownMenu;
  Color? underlineColor;
  Widget? iconDropdown;

  //space
  EdgeInsets? paddingText;

  //boarder
  Decoration? decorationOutlineDropdown;


  //error message
  String? errorBackendKeyJson;
  Map<String, dynamic>? errorBackendJson;

  // error style
  Decoration? errorOutlineDropdownDropdown;
  // String? errorMessageBackend;
  TextStyle? errorTextStyle;

  TextDirection? textDirection;


  DropdownFastor( {
    required this.width,
    required this.names ,
    required this.iconSize,
    required this.listener,
    required this.onRemoveSelected,
    // this.removeSelected,
    this.height_frame,
    this.radiusButton,
    this.spinnerTriangleWidth,
    this.hintText,
    this.hintWidget,
    this.textStyleItemDropdown,
    this.textAlignItemDropdown,
    this.colorHintText,
    this.colorItemText,
    this.colorItemTextSelected,
    this.colorDropdownMenu,
    this.colorDropdownButtonOutline,
    // this.colorDropdownButtonBackground,
    this.underlineColor,
    this.iconDropdown,
    this.previousSelectedText,
    this.previousPosition,
    this.colorPreviousSelected,
    this.paddingText,
    this.decorationOutlineDropdown,
    this.errorBackendKeyJson,
    this.errorBackendJson,
    this.errorOutlineDropdownDropdown,
    // this.errorMessageBackend,
    this.errorTextStyle,
    this.textDirection
  }) {

    spinnerTriangleWidth ??= 50;
    // removeSelected ??= false;
    colorPreviousSelected ??= Colors.black;

    textDirection ??= LangFastor.getTextDirection();
  }

  @override
  DropdownFastorState createState()  => DropdownFastorState();

}

class  DropdownFastorState extends State<DropdownFastor > {

  String?  selected_name ;
  int?  selected_position ;
  bool userNotClickedYetOnButtonDropdown = true;

  @override
  Widget build(BuildContext context) {
    return getDirection();
  }

  Widget getDirection() {
    return   Directionality(
      textDirection:   widget.textDirection!,
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
      width: widget.width,
      child: dropdown() ,
    );
  }

  //---------------------------------------------------------------------------- helper

  double getHeightFrame(){
    return widget.height_frame??DropdownFastor.defaultHeight;
  }


  Color? getColorItemTextWhenSelectedOrNot ( int positionName){
    var defaultColor = widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :   widget.colorItemText;
    bool isSamePositionSelected = positionName ==  selected_position;
    if(isSamePositionSelected )  {
      // Log.i( "fastor - getColorItemTextWhenSelectedOrNot() - isSkipChangeColorSelected");
      return widget.colorItemTextSelected??defaultColor;
    }
    return defaultColor;
  }

  Color? getColorItemTextWhenSelected ( ){
    var defaultColor = widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :   widget.colorItemText;
    return widget.colorItemTextSelected??defaultColor;
  }

}