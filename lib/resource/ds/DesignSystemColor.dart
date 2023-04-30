
import 'package:fastor_app_ui_widget/resource/color/ResourceColor.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/**
    - create  new one
    static var  = HexColor( "#" );
 */
class DSColor extends ResourceColor {

  //................................................. cardview

  static var cardview_shadow = HexColor( ResourceColor.blue_aquamarine  );
  static var cardview_boarderLine = HexColor( ResourceColor.blueDark_transparent );
  static var cardview_background_color = HexColor( ResourceColor.white  );

  //  .............................................. progress


  static var ds_progress = HexColor( ResourceColor.orange );
  static var ds_progress_fade_1 = HexColor( ResourceColor.orange );
  static var ds_progress_fade_2 = HexColor( ResourceColor.orange );

  // ..............................................  background screen and layout

  //all screen
  static var ds_background_all_screen = HexColor( ResourceColor.white );

  //layout
  static var ds_background_layout_1  = HexColor(ResourceColor.white );
  static var ds_background_layout_2  = HexColor(ResourceColor.white );
  static var ds_background_layout_3  = HexColor(ResourceColor.white );
  static var ds_background_layout_4  = HexColor(ResourceColor.white );

  //transparent
  static var ds_background_layout_3_transparent  = HexColor(ResourceColor.blueDark_transparent );

  //---------------------------------------------------------- toolbar

  static var ds_background_toolbar  = HexColor( ResourceColor.black);
  static var toolbar_title = HexColor( ResourceColor.white)  ;
  static var toolbar_icon_color = HexColor(ResourceColor.white);

  //------------------------------------------------------------ navigation

  static var ds_background_navigation  = HexColor(ResourceColor.blueLight );

  //------------------------------------------------------ android home button

  static var homeButtons_background  = HexColor(ResourceColor.blueLight );

  //  .............................................. color: text

  //light
  static var  text_parent = HexColor( ResourceColor.black );
  static var  text_h1 = HexColor( ResourceColor.black );
  static var  text_h2 = HexColor( ResourceColor.black );
  static var  text_h3 = HexColor( ResourceColor.black );
  static var  text_h4 = HexColor( ResourceColor.black );

  //dark
  static var  ds_text_h1_for_background_dark =  HexColor( ResourceColor.black );
  static var  ds_text_h2_for_background_dark = HexColor( ResourceColor.black );
  static var  ds_text_h3_for_background_dark = HexColor( ResourceColor.black  );
  static var  ds_text_h4_for_background_dark = HexColor(ResourceColor.black );

  //Title and small
  static var  ds_text_h2_for_background_dark_typeTitle = HexColor( ResourceColor.white );
  static var ds_text_h2_for_background_light_typeTitle = text_h2;// HexColor( "#1c201f" );
  static var ds_text_h2_for_background_dark_typeSmall = HexColor( ResourceColor.white );
  static var ds_text_h2_for_background_light_typeSmall = text_h2; //HexColor( "#212727" );

  //error or cancel or previousData
  static var ds_error = HexColor( ResourceColor.orange);
  static var ds_cancel = HexColor( ResourceColor.orange);

  //  .............................................. button

  //large
  static var ds_button_large_text = HexColor( ResourceColor.black );
  static var ds_button_large_background = HexColor( ResourceColor.gray_dark_blue);

  //small
  static var ds_button_small_text = HexColor( ResourceColor.black  );
  static var ds_button_small_background = HexColor( ResourceColor.gray_dark_blue);

  // .............................................. textfield

  // static var ds_text_hint =  HexColor("#75aeb9");
  static var ds_textfield_hint = HexColor( ResourceColor.gray_dark_blue);
  static var ds_textfield_text = HexColor( ResourceColor.black );
  static var ds_textfield_boarder_line = HexColor(ResourceColor. blueGreen_transparent);
  static var ds_textfield_boarder_background = HexColor( ResourceColor.white );

  static  var cursor_selectedText = ds_progress;

  //----------------------------------------------- checkbox, radio

  static var tap_active = HexColor( ResourceColor.blue_aquamarine );
  static var tap_inactive = HexColor( ResourceColor.black );

  //----------------------------------------------- switch

  static var switch_active = HexColor( ResourceColor.blue_aquamarine );
  static var switch_inactive = HexColor( ResourceColor.black );

  //----------------------------------------------- toast

  static var ds_toast_background = HexColor( ResourceColor.blue_aquamarine );
  static var ds_toast_text = HexColor( ResourceColor.black );


  //------------------------------------------------- image

  static var image_circle =  HexColor( ResourceColor.blue_aquamarine ) ; //75aeb9

  //---------------------------------------------------- spinner

  // static var spinner_hint =   ds_textfield_hint ;
  // static var spinner_label =   DSColor.text_h2 ;
  // static var spinner_item_name =   ds_textfield_text ;
  // static var spinner_selected_name = ds_textfield_text;
  static var spinner_background  = HexColor( ResourceColor.white );
  static var spinner_underline =   ds_textfield_hint ;
  static var spinner_hint =   ds_textfield_hint ;

  //-------------------------------------------------------- calender

  static var calendar_selected_background = tap_active;
  static var calendar_card_background = ds_progress;
  // static var calendar_card_line = Colors.transparent;
  static var calendar_card_event_color = ds_textfield_hint;

  //---------------------------------------------------------- line separator

  static var separatorLine_backgroundWhite =    HexColor( ResourceColor.blue_aquamarine ) ;

  //--------------------------------------------------------------- hyperlink

  static var link =  HexColor( ResourceColor.blueLight );

  //---------------------------------------------------------------- table view

  static var table_header_background = HexColor( ResourceColor.blueDark );
  static var table_header_title = HexColor( ResourceColor.blueLight );
  static var table_header_boader = HexColor( ResourceColor.black );
  static var table_row_background = HexColor( ResourceColor.white );
  static var table_row_title = HexColor( ResourceColor.black );
  static var table_row_boader = HexColor( ResourceColor.black );

  //------------------------------------------------------------------ menu

  static var menu_background = HexColor( ResourceColor.blueDark );
  static var menu_selected = HexColor( ResourceColor.blueLight );

  //----------------------------------------------------------------- scrollbar

  static var scrollbar_thumb = HexColor( ResourceColor.black );

}