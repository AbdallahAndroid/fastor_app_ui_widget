import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';

class SwitchFastor extends StatefulWidget {

  //  action
  bool defaultValue;

  //tap
  // GestureTapCallback onTap;
  ValueChanged<bool> onChange;

  //text
  Widget? text_child;
  String? text = "";
  TextStyle? textStyle;

  //size
  double? size_scale;// = 1.0;

  //space
  EdgeInsets? margin;
  EdgeInsets? padding;
  bool? removePaddingClick ;

  //background
  Decoration?  decoration;
  Color?  colorBackground;

  //color
  Color? color_switch_active;
  Color? color_switch_inactive;

  SwitchFastor({
    //  action
    required this.defaultValue, /// default value

    //tap
    // required this. onTap,
    required  this.onChange,

    //test
    this.text_child ,
    this.text = "",
    this.textStyle,

    //size
    this.size_scale  ,

    //space
    this.margin,
    this.padding,
    this.removePaddingClick ,

    //background
    this.decoration,
    this.colorBackground,

    //colors
    this.color_switch_active,
    this.color_switch_inactive
  }) {

    setDefaultValue();
  }

  void setDefaultValue() {
    removePaddingClick ??= true;
    size_scale ??= 1.0;
  }

  @override
  _SwitchFastorState createState() => _SwitchFastorState();


}

class _SwitchFastorState extends State<SwitchFastor> {


  @override
  Widget build(BuildContext context) {
    return switchUi( );
  }


  Widget  switchUi(){

    // text used in second pirority
    if( widget.text_child == null ) {
      widget.text_child = Text( "" + widget.text.toString(), style: widget.textStyle );
    }

    //sw
    var sw = switchButton();
    var row = switchSized(sw);

    // space
    var cont = Container(
        color:  widget.colorBackground,
        decoration: widget.decoration,
        margin: widget.margin ,
        padding: widget.padding,
        child:  row );

    return cont;

  }

  Widget switchButton(){
    return Switch(
        activeColor: widget.color_switch_active,
        inactiveTrackColor: widget.color_switch_inactive,
        value: widget.defaultValue,
        onChanged: ( statusUpdate){

          setState(() {
            widget.defaultValue = statusUpdate;
          });

          widget.onChange( statusUpdate);
        } );

  }

  Widget switchSized(Widget sw) {

    // default padding size
    final double defaultPaddingSizeClick = 20;


    /**
     * - why 40?
     *    because the default padding is 40
     */
    double paddingCheckBoxClick = 40;
    if ( widget.removePaddingClick! ) {
      paddingCheckBoxClick = defaultPaddingSizeClick;
    }

    //fix : remove default
    var sizeBox = SizedBox( child:  sw, width: paddingCheckBoxClick, height: paddingCheckBoxClick   );

    //fix material >> cause background white
    // var material = Material(child:  sizeBox    );

    //size by scale
    var scale = Transform.scale(scale: widget.size_scale!, child:  sizeBox );

    //space between title
    var spaceBetweenTitle = EmptyView.empty( 13, 5);

    //row
    var row = RowTemplate.wrapChildren( [ scale, spaceBetweenTitle, widget.text_child! ]);
    //case: have custome padding
    //fix default padding at the container when there is padding for click
    if( widget.removePaddingClick == false ){
      widget.padding = EdgeInsetsTools.fixDefaultSpace( widget.padding, defaultPaddingSizeClick);
    }
    return row;
  }


}