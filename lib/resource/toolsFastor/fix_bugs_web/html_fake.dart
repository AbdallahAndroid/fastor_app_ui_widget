import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

//--------------------------------------------------------------- get windows language
/**
 * html.window.navigator.language ;
 */


Window get window => Window();

class Window {
  Navigator get navigator =>  Navigator();
}

class Navigator {
  String get language => getLanguage( );
}

dynamic getLanguage(){
  return LanguageTools.getLocalLanguage( FakeHTMLConstant.context! );
}

class FakeHTMLConstant {

  static BuildContext? context ;
}

//---------------------------------------------------------------- SEO Render widget

dynamic ParagraphElement(){
  return null;
}

class HeadingElement {

  static dynamic h1(){
    return null;
  }



}

class HtmlElement {

}

//---------------------------------------------------------------- dart:html, fix class  IFrameElement

class IFrameElement {


  String?   allow  ;

  bool?   allowFullscreen  ;

  bool? allowPaymentRequest  ;

  String?   csp  ;

  String?   height  ;

  String?   name  ;


  String?   referrerPolicy ;

  String?   src  ;

  String?   srcdoc  ;

  String?   width  ;



  CssStyleDeclaration   style = new CssStyleDeclaration();

  ClassFakeOnLoad  onLoad = new ClassFakeOnLoad();

// Future<String> onLoad() async { return ""; }


}

class ClassFakeOnLoad  {

  void listen(void onData(String event)?,
      {Function? onError, void onDone()?, bool? cancelOnError}) {}

}

class CssStyleDeclaration  {

  String? border ;


  String?   width  ;

  String?  height ;

}

//---------------------------------------------------------- register


dynamic platformViewRegistry = FakePlatformViewRegistry();

// or a more thorough shim like this one
class FakePlatformViewRegistry {
  void registerViewFactory(
      String viewTypeId, dynamic Function(int) viewFactory) {
    throw UnsupportedError("platform view registry in non-web context");
  }
}

