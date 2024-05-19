import 'package:flutter/material.dart';


import 'package:fastor_app_ui_widget/resource/resources/ds/LevelDS.dart';
import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';

@Deprecated( "instead use \"SwitchFastor()\" ")
class SwitchTemplate {


  static Widget  t(
      {


        //  action
        required bool value,

        //tap
        required GestureTapCallback onTap,
        required ValueChanged<bool> onChange,

        //test
        Widget? text_child ,
        String? text = "",

        //size
        double? size_scale = 1.0,

        //space
        EdgeInsets? margin,
        EdgeInsets? padding,
        bool? removePaddingClick = true,

        //
        Decoration? decoration,
        Color? colorBackground,
      }
      ){

    // text used in second pirority
    if( text_child == null ) {
      text_child = TextTemplate.t( text, levelDS: LevelDS.l3);
    }

    //sw
    var sw = Switch(
        activeColor: DSColor.switch_active,
        inactiveTrackColor: DSColor.switch_inactive,
        value: value,
        onChanged: onChange);


    // default padding size
    final double defaultPaddingSizeClick = 20;

    /**
     * - why 40?
     *    because the default padding is 40
     */
    double paddingCheckBoxClick = 40;
    if ( removePaddingClick! ) {
      paddingCheckBoxClick = defaultPaddingSizeClick;
    }

    //fix : remove default
    var sizeBox = SizedBox( child:  sw, width: paddingCheckBoxClick, height: paddingCheckBoxClick   );

    //fix material
    var material = Material(child:  sizeBox    );

    //size by scale
    var scale = Transform.scale(scale: size_scale!, child:  material );

    //space between title
    var spaceBetweenTitle = EmptyView.empty( 13, 5);

    //row
    var row = RowTemplate.wrapChildren( [ scale, spaceBetweenTitle, text_child ]);

    //case: have custome padding
    //fix default padding at the container when there is padding for click
    if(removePaddingClick == false ){
      padding = EdgeInsetsTools.fixDefaultSpace( padding, defaultPaddingSizeClick);
    }

    // space
    var ct = Container(
        color:  colorBackground,
        decoration: decoration,
        margin: margin ,
        padding: padding,
        child:  row );

    //tab on
    var tab = GestureDetector( child:  ct ,
        onTap: onTap,
        // onTap: () {
        //
        //   onChange(value);
        // }
    );
    return tab;

  }


}