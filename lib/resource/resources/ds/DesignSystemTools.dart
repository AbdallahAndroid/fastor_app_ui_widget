
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

import 'DesignSystemFont.dart';
import 'DesignSystemColor.dart';
import 'DesignSystemDimen.dart';
import 'LevelDS.dart';

class DesignSystemTools {


  //------------------------------------------------------------------- color text

  static Color getColorDesignSystem_text(LevelDS levelDS, Color? colorCustom ) {

    //mobile enter custom
    if ( colorCustom != null ) return colorCustom;

    //default
    var color = DSColor.text_h1;

    //choose
    if( levelDS == LevelDS.parent ) {
      color = DSColor.text_parent;
    }
    if( levelDS == LevelDS.l1 ) {
      color = DSColor.text_h1;
    }
    if( levelDS == LevelDS.l1_dark ) {
      color = DSColor.ds_text_h1_for_background_dark;
    }
    if( levelDS == LevelDS.l2 ) {
      color = DSColor.text_h2;
    }
    if( levelDS == LevelDS.l2_dark ) {
      color = DSColor.ds_text_h2_for_background_dark;
    }
    if( levelDS == LevelDS.l3 ) {
      color = DSColor.text_h3;
    }
    if( levelDS == LevelDS.l3_dark ) {
      color = DSColor.ds_text_h3_for_background_dark;
      // Log.i( "l3_dark");
    }
    if( levelDS == LevelDS.l4 ) {
      color = DSColor.text_h4;
    }
    if( levelDS == LevelDS.l4_dark ) {
      color = DSColor.ds_text_h4_for_background_dark;
    }
    // Log.i( "color "  + color.toString());
    return color;
  }


  static Color getColorDesignSystem_buttonText(LevelDS levelDS, Color? colorCustom ) {

    //mobile enter custom
    if ( colorCustom != null ) return colorCustom;

    //default
    var color = DSColor.ds_button_large_text;

    //choose
    if( levelDS == LevelDS.parent ) {
      color = DSColor.ds_button_large_text;
    }
    if( levelDS == LevelDS.l1 ) {
      color = DSColor.ds_button_large_text;
    }
    if( levelDS == LevelDS.l2 ) {
      color = DSColor.ds_button_small_text;
    }
    if( levelDS == LevelDS.l3 ) {
      color = DSColor.ds_button_small_text;
    }
    if( levelDS == LevelDS.l4 ) {
      color = DSColor.ds_button_small_text;
    }
    return color;
  }

  //----------------------------------------------------------------------- color background

  static Color getColorDesignSystem_buttonBackground(LevelDS levelDS, Color? colorCustom ) {

    //mobile enter custom
    if ( colorCustom != null ) return colorCustom;

    //default
    var color = DSColor.ds_button_large_background;

    //choose
    if( levelDS == LevelDS.parent ) {
      color = DSColor.ds_button_large_background;
    }
    if( levelDS == LevelDS.l1 ) {
      color = DSColor.ds_button_large_background;
    }
    if( levelDS == LevelDS.l2 ) {
      color = DSColor.ds_button_small_background;
    }
    if( levelDS == LevelDS.l3 ) {
      color = DSColor.ds_button_small_background;
    }
    if( levelDS == LevelDS.l4 ) {
      color = DSColor.ds_button_small_background;
    }
    return color;
  }

  //---------------------------------------------------------------------- size text

  static double getDimenDesignSystem_text(LevelDS levelDS , double? custom ) {



    //mobile enter custom
    if ( custom != null &&  custom != 0 ) return custom;

    //default
    custom ??= DSDimen.text_level_1;
    var d = DSDimen.text_level_1;

    //choose
    if( levelDS == LevelDS.parent ) {
      d = DSDimen.text_level_parent ;
    }
    if( levelDS == LevelDS.l1 ) {
      d = DSDimen.text_level_1;
    }
    if( levelDS == LevelDS.l1_dark ) {
      d = DSDimen.text_level_1;
    }
    if( levelDS == LevelDS.l2 ) {
      d = DSDimen.text_level_2;
    }
    if( levelDS == LevelDS.l2_dark ) {
      d = DSDimen.text_level_2;
    }
    if( levelDS == LevelDS.l3 ) {
      d = DSDimen.text_level_3;
    }
    if( levelDS == LevelDS.l3_dark ) {
      d = DSDimen.text_level_3;
    }
    if( levelDS == LevelDS.l4 ) {
      d = DSDimen.text_level_4;
    }
    if( levelDS == LevelDS.l4_dark ) {
      d = DSDimen.text_level_4;
    }

    return d;
  }

  //----------------------------------------------------------------------- get font

  static String getFontDesignSystem_text(LevelDS levelDS , String? custom ) {

    //mobile enter custom
    if ( custom != null  ) return custom;

    //default
    var d = DSFont.h1;

    //choose
    if( levelDS == LevelDS.parent ) {
      d = DSFont.hparent;
    }
    if( levelDS == LevelDS.l1 ) {
      d = DSFont.h1;
    }
    if( levelDS == LevelDS.l2 ) {
      d = DSFont.h2;
    }
    if( levelDS == LevelDS.l3 ) {
      d = DSFont.h3;
    }
    if( levelDS == LevelDS.l4 ) {
      d = DSFont.h4;
    }

    return d;
  }


  static String getFontDesignSystem_button(LevelDS levelDS , String? custom ) {

    //mobile enter custom
    if ( custom != null  ) return custom;

    //default
    var d = DSFont.button_large;

    //choose
    if( levelDS == LevelDS.parent ) {
      d = DSFont.button_large;
    }
    if( levelDS == LevelDS.l1 ) {
      d = DSFont.button_large;
    }
    if( levelDS == LevelDS.l2 ) {
      d = DSFont.button_small;
    }
    if( levelDS == LevelDS.l3 ) {
      d = DSFont.button_small;
    }
    if( levelDS == LevelDS.l4 ) {
      d = DSFont.button_small;
    }

    return d;
  }

  //------------------------------------------------------------- size

  static Size? getFixedSize(double? width, double? height, double dimen) {
    //fixed size
    Size? fixedSize = null;
    //print( "fastor - getFixedSize() - width: " + width.toString() + " /h: " + height.toString() );
    bool haveBoth = (width != null) & (height != null);
    bool haveWidthOnly = width != null;
    //print( "fastor - getFixedSize() - haveBoth: " + haveBoth.toString() + " /haveWidthOnly: " + haveWidthOnly.toString() );
    if (haveBoth) {
      fixedSize = Size(width!, height!);
    } else if ( haveWidthOnly ) {
      double heightCal = calculateHeightOfText( dimen);
      fixedSize = Size(width,  heightCal);
    } else {
      fixedSize = null;
    }
    return fixedSize;
  }


  static double calculateHeightOfText(double dimenFont ) {
    //print("fastor - calculateHeightOfText() - dimenFont: $dimenFont");
    return dimenFont * 2.2 ;
  }

}