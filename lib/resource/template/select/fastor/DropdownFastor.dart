// class DropdownFastor e
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

typedef DropDownSelectChangeListenerTest = Function(String name, int poistion );

double _defaultHeight = 40;

class DropdownFastor extends StatefulWidget {

  //required
  List<String> names;
  DropDownSelectChangeListenerTest listener;

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

  //previous
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


  DropdownFastor( {
    required this.width,
    required this.names ,
    required this.iconSize,
    required this.listener,
    this.height_frame,
    this.radiusButton,
    this.spinnerTriangleWidth,
    this.hintText,
    this.hintWidget,
    this.textStyleItemDropdown,
    this.colorHintText,
    this.colorItemText,
    this.colorItemTextSelected,
    this.colorDropdownMenu,
    this.colorDropdownButtonOutline,
    // this.colorDropdownButtonBackground,
    this.underlineColor,
    this.iconDropdown,
    this.previousSelectedText,
    this.colorPreviousSelected,
    this.paddingText,
    this.decorationOutlineDropdown,
    this.errorBackendKeyJson,
    this.errorBackendJson,
    this.errorOutlineDropdownDropdown,
    // this.errorMessageBackend,
    this.errorTextStyle
  }) {

    spinnerTriangleWidth ??= 50;

    colorPreviousSelected ??= Colors.black;
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
        color: widget.colorPreviousSelected
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
      onSelectPosition:    (p, isRemoveSelected ) {
        if( isRemoveSelected ){
          _selected_name =  null;
          return;
        }

        //set new result
        _selected_name = widget.names[p];
        _selected_position = p;

        //callback
        widget.listener( _selected_name!, _selected_position! );
      },
      hintWidget: widget.hintWidget??_hint() ,
    );
  }


  Widget _hint(){
    return  TextFastor( widget.hintText??"select",
        // padding: widget.paddingText??EdgeInsets.all( 5),
        color:  widget.colorHintText,
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
      padding: widget.paddingText??EdgeInsets.only(top: 5, left: 5),
      color: getColorItemTextWhenSelectedOrNot(positionName),
    );
  }


  Color? getColorItemTextWhenSelectedOrNot ( int positionName){
    var defaultColor = widget.colorItemText;
    bool isSamePositionSelected = positionName == _selected_position;
    if(isSamePositionSelected )  {
      // Log.i( "fastor - getColorItemTextWhenSelectedOrNot() - isSkipChangeColorSelected");
      return widget.colorItemTextSelected??defaultColor;
    }
    return defaultColor;
  }


}