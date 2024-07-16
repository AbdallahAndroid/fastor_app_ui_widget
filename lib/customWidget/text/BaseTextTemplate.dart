import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

extension BaseTextTemplate on  TextApp  {

  //-------------------------------------------------------------------------- base

  Widget  text_without_surround( ) {

    //choose type
    Widget chooseTxt ;
    if( selectedTextAllow! ) {
      chooseTxt =  SelectableText( s ,
          // Cursor
          cursorColor: Colors.grey,
          showCursor: selectedTextAllow!,
          //style
          textAlign: textAlign,
          maxLines: maxLines,
          style: myStyle );

    } else {
      //normal
      chooseTxt =  Text( s ,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: myStyle );
    }


    //seo
    return chooseTxt;
  }



  Widget  chooseChildWhenPressed(String s, TextAlign textAlign, TextStyle myStyle,
      int? maxLines, VoidCallback? onPressed, bool selectedTextAllow ) {

    //simple text
    Widget text   =  text_without_surround( );

    if( onPressed != null ) {
      return _GestureDetector(text, onPressed);
    }  else {
      return text;
    }
  }

  Widget _GestureDetector(Widget child, VoidCallback onPressed) {



    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: child,
    );
  }


}
