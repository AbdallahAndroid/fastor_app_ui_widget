// class DropdownFastor e
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

typedef DropDownSelectChangeListenerTest = Function(String name, int poistion );
typedef DropDownRemoveSelectedListener = Function( );

double _defaultHeight = 40;

class DropdownFastor extends StatefulWidget {

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
  _DropdownFastorState createState()  => _DropdownFastorState();

}

class _DropdownFastorState extends State<DropdownFastor > {

  String? _selected_name ;
  int? _selected_position ;
  bool userNotClickedYetOnButtonDropdown = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: showDropdownAndPreviousTitle() ,
    );
  }

  //---------------------------------------------------------------------------- dropdown

  double getHeightFrame(){
    return widget.height_frame??_defaultHeight;
  }


  Widget showDropdownAndPreviousTitle(){
    return ColumnFastor( children: [
      dropdown(),
      tv_previousSelected()
    ]);
  }


  Widget tv_previousSelected(){
    if( widget.previousSelectedText == null ) return SizedBox();
    // Log.i( "tv_city_previousSelected() - city_selected_name: " + city_selected_name );
    return TextFastor(
      widget.previousSelectedText??"" ,
      levelDS: LevelDS.l4,
      margin: widget.paddingText??EdgeInsets.only(top: DSDimen.space_level_4),
      color: widget.colorPreviousSelected,
      // color:   widget.colorHintText,
      fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize : null ,
      fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,

    );
  }


  Widget dropdown(){
    return  SpinnerView(
      childers: _listItemDropDownWidget(),
      width_frame: widget.width,
      height_frame: widget.height_frame??_defaultHeight,
      radiusButton : widget.radiusButton,
      iconSize: widget.iconSize,
      colorDropdownMenu: widget.colorDropdownMenu,
      colorDropdownButtonOutline: widget.colorDropdownButtonOutline,
      underlineColor: widget.underlineColor,
      iconDropdown: widget.iconDropdown,
      textStyleItemDropdown: widget.textStyleItemDropdown,
      decorationOutlineDropdown: widget.decorationOutlineDropdown,
      errorBackendKeyJson: widget.errorBackendKeyJson,
      errorBackendJson: widget.errorBackendJson,
      errorTextStyle: widget.errorTextStyle,
      errorOutlineDropdownDropdown: widget.errorOutlineDropdownDropdown,
      hintWidget: widget.hintWidget??_hint() ,
      previousPosition: widget.previousPosition,
      textDirection : widget.textDirection,
      onSelectPosition:    (p, isRemoveSelected ) {
        if( isRemoveSelected ){
          _selected_name =  null;
          if( widget.onRemoveSelected != null ) widget.onRemoveSelected!();
          return;
        }

        //set new result
        _selected_name = widget.names[p];
        _selected_position = p;

        //callback
        widget.listener( _selected_name!, _selected_position! );
      },

    );
  }


  // int? getPreviousPositon(){
  //
  //   //first pirority : return the previous selected when found
  //   if(widget.previousPosition != null ) {
  //     return null;
  //   }
  //
  //   //second pirority : see remove selected
  //   if(widget.removeSelected! == true ) {
  //     return null;
  //   }
  //
  //   //third pirority default
  //   return widget.previousPosition;
  // }


  Widget _hint(){
    return  TextFastor( widget.hintText??"select",
        padding: widget.paddingText??EdgeInsets.only(top: 10, left: 10),
        fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize : null ,
        fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,
        color:   widget.colorHintText,
        textAlign: widget.textAlignItemDropdown ?? TextAlign.left ,
        levelDS: LevelDS.l2);
  }


  List<Widget> _listItemDropDownWidget() {
    List<Widget> listWidget = [];
    int position = 0;
    widget.names.forEach((name) {

      Widget w = _getItemDropdownWidget(name, position);
      listWidget.add( w );
      position += 1;
    });
    return listWidget;
  }


  Widget _getItemDropdownWidget(String name, int positionName){
    return TextFastor( name,
      levelDS: LevelDS.l3,
      padding: widget.paddingText??EdgeInsets.only(top: 10, left: 10),
      color: getColorItemTextWhenSelectedOrNot(positionName),
      // color:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :  widget.colorHintText,
      fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize : null ,
      fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,
      textAlign: widget.textAlignItemDropdown ?? TextAlign.left ,
    );
  }


  Color? getColorItemTextWhenSelectedOrNot ( int positionName){
    var defaultColor = widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :   widget.colorItemText;
    bool isSamePositionSelected = positionName == _selected_position;
    if(isSamePositionSelected )  {
      // Log.i( "fastor - getColorItemTextWhenSelectedOrNot() - isSkipChangeColorSelected");
      return widget.colorItemTextSelected??defaultColor;
    }
    return defaultColor;
  }


}