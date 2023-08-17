// class DropdownFastor e
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

typedef DropDownSelectChangeListener = Function(String name, int poistion );


class DropdownFastor extends StatefulWidget {

  //required
  List<String> names;
  DropDownSelectChangeListener listener;

  //size
  double? height_frame ;
  double width;

  // hint
  String? hintText;
  Widget? hintWidget;
  Color? colorHintText;

  //previous
  String? previousSelectedText;
  Color? colorPreviousSelected;

  //spin
  double? spinnerTriangleWidth;

  //colors
  Color? colorItemText;
  Color? dropdownColor;
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
  // Decoration? errorOutlineDropdownDropdown;
  // String? errorMessageBackend;
  TextStyle? errorTextStyle;


  DropdownFastor( {
    required this.width,
    required this.names ,
    required this.listener,
    this.height_frame,
    this.spinnerTriangleWidth,
    this.hintText,
    this.colorHintText,
    this.colorItemText,
    this.dropdownColor,
    this.underlineColor,
    this.iconDropdown,
    this.previousSelectedText,
    this.colorPreviousSelected,
    this.paddingText,
    this.decorationOutlineDropdown,
    this.errorBackendKeyJson,
    this.errorBackendJson,
    // this.errorOutlineDropdownDropdown,
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

  @override
  Widget build(BuildContext context) {

    return Container(
        child: dropdownAndPreviousSelectedText()
    );
  }


  Widget dropdownAndPreviousSelectedText(){
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

    //check before create view
    if( widget.names.length == 0 ) {
      return EmptyView.zero();
    }

    var spin =  SpinnerView(
      childers: _listItemDropDownWidget(),
      width_frame: widget.width,
      height_frame: widget.height_frame??40,
      dropdownColor: widget.dropdownColor,
      underlineColor: widget.underlineColor,
      iconDropdown: widget.iconDropdown,
      decorationOutlineDropdown: widget.decorationOutlineDropdown,
      errorBackendKeyJson: widget.errorBackendKeyJson,
      errorBackendJson: widget.errorBackendJson,
      errorTextStyle: widget.errorTextStyle,
      onSelectPosition:    (p, isRemoveSelected ) {
       // Log.i( "dropdown() -  position: " + p.toString() );

        if( isRemoveSelected ){
          _selected_name =  null;
          return;
        }

        _selected_name = widget.names[p];
        _selected_position = p;

        widget.listener( _selected_name!, _selected_position! );
      },
      hintWidget: widget.hintWidget??_hint() ,
    );

    //decoration
    return Container( child: spin,
      decoration: BoarderHelper.box(),
    );
  }

  Widget _hint(){
    return  TextFastor( widget.hintText??"select",
        padding: widget.paddingText??EdgeInsets.all( 5),
        color: widget.colorHintText,
        levelDS: LevelDS.l2);
  }


  List<Widget> _listItemDropDownWidget() {
    List<Widget> listWidget = [];
    widget.names.forEach((name) {

      Widget w = _getItemDropdownWidget(name);
      listWidget.add( w );
    });
    return listWidget;
  }

  Widget _getItemDropdownWidget(String name){
    return TextFastor( name,
        levelDS: LevelDS.l3,
        padding: widget.paddingText??EdgeInsets.only(top: 5, left: 5),
        color: widget.colorItemText,
        width: widget.width - widget.spinnerTriangleWidth!
    );
  }


}