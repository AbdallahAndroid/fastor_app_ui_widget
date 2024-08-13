

import 'package:fastor_app_ui_widget/customWidget/select/widget/DropdownContent.dart';
import 'package:fastor_app_ui_widget/customWidget/select/widget/ProgressDropdown.dart';
import 'package:flutter/material.dart';

typedef DropDownSelectChangeListenerTest = Function(String name, int poistion );
typedef DropDownRemoveSelectedListener = Function( );



class DropdownApp extends StatefulWidget {

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

  // menu
  double? menuMaxHeight;

  //space
  EdgeInsets? paddingText;

  //boarder
  Decoration? decorationOutlineDropdown;
  Decoration? decorationProgressView;

  //error message
  String? errorBackendKeyJson;
  Map<String, dynamic>? errorBackendJson;

  // error style
  Decoration? errorOutlineDropdownDropdown;
  String? errorMessageBackend;
  TextStyle? errorTextStyle;

  TextDirection? textDirection;

  //progress
  bool? showProgress;
  double? sizeProgress;
  Color? colorProgress;

  DropdownApp( {
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
    this.menuMaxHeight,
    this.underlineColor,
    this.iconDropdown,
    this.previousSelectedText,
    this.previousPosition,
    this.colorPreviousSelected,
    this.paddingText,
    this.decorationOutlineDropdown,
    this.decorationProgressView,
    this.errorMessageBackend,
    this.errorBackendKeyJson,
    this.errorBackendJson,
    this.errorOutlineDropdownDropdown,
    // this.errorMessageBackend,
    this.errorTextStyle,
    this.textDirection,
    this.showProgress,
    this.sizeProgress,
    this.colorProgress,
  }) {
    setDefaultValues();
  }


  setDefaultValues(){
    spinnerTriangleWidth ??= 50;
    // removeSelected ??= false;
    colorPreviousSelected ??= Colors.black;

    //progress
    showProgress ??= false;
    setDefaultProgressSize();
    setDefaultProgressColor();

    searchInNamesForThePositionOfPreviousTextSelected();
    searchInNamesForTheTextPrevious();

  }


  void setDefaultProgressSize() {
    if( sizeProgress != null ) return;
    sizeProgress = iconSize;
  }


  void setDefaultProgressColor() {
    if( colorProgress != null ) return;
    if( colorItemTextSelected != null ) {
      colorProgress = colorItemTextSelected;
      return;
    }
    if( colorItemText != null ) {
      colorProgress = colorItemText;
      return;
    }
    colorProgress  = colorPreviousSelected;
  }



  void searchInNamesForThePositionOfPreviousTextSelected() {
    if( names == null || names.isEmpty ) return;
    if( previousSelectedText == null ) return;
    int index = 0;
    names?.forEach((element) {
      bool foundPosition = element == previousSelectedText;
      if( foundPosition ) {
        previousPosition = index;
        return;
      }
      index = index + 1;
    });
  }


  void searchInNamesForTheTextPrevious() {
    if( names == null || names.isEmpty ) return;
    if( previousPosition == null ) return;
    if( previousSelectedText == null ) return;
    int index = 0;
    names?.forEach((name) {
      bool found = previousPosition == index;
      if( found ) {
        previousSelectedText = name;
        return;
      }
      index = index + 1;
    });
  }

  @override
  DropdownAppState createState()  => DropdownAppState();



}

class  DropdownAppState extends State<DropdownApp > {

  String?  selected_name ;
  int?  selected_position ;
  bool userNotClickedYetOnButtonDropdown = true;


  @override
  void initState() {
    setSelectedPositionValueEqualToPreviousPosition();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return getDirection();
  }

  Widget getDirection() {
    return   Directionality(
      textDirection:   TextDirection.rtl, //widget.textDirection??TextDirection.ltr,
      child: contentUI(),
      // child:   Builder(
      //   builder: (BuildContext context) {
      //     return   MediaQuery(
      //       data: MediaQuery.of(context).copyWith(
      //         textScaleFactor: 1.0,
      //       ),
      //       child: contentUI(),
      //     );
      //   },
      // ),
    );
  }


  Widget contentUI(){
    return Container(
      width: widget.width,
      child: chooseProgressViewOrDropdown() ,
    );
  }


  Widget chooseProgressViewOrDropdown(){
    if( widget.showProgress! ) {
      return progressWidget();
    }

    return dropdown();
  }

  //---------------------------------------------------------------------------- helper

  double getHeightFrame(){
    return widget.height_frame??DropdownApp.defaultHeight;
  }


  Color? getColorItemTextWhenSelectedOrNot ( int positionName){
    var defaultColor = widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :   widget.colorItemText;
    bool isSamePositionSelected = positionName ==  selected_position;
    //print( "getColorItemTextWhenSelectedOrNot() - positionName: $positionName /isSamePositionSelected: $isSamePositionSelected");
    if(isSamePositionSelected )  {
      return widget.colorItemTextSelected??defaultColor;
    }
    return defaultColor;
  }

  Color? getColorItemTextWhenSelected ( ){
    var defaultColor = widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :   widget.colorItemText;
    return widget.colorItemTextSelected??defaultColor;
  }

  /// this will make the previous selected text is colored
  void setSelectedPositionValueEqualToPreviousPosition() {
    selected_position = widget.previousPosition;
    selected_name = widget.previousSelectedText;
  }

}