

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';

import 'package:flutter/material.dart';


@Deprecated( "Under Testing")
class FastorMaterialApp extends StatelessWidget {

  Widget home;
  String appName;

  FastorMaterialApp(  {
   required this.appName,
    required this.home
    });

  //extends MaterialApp {

  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    initValues();
    return getMaterialApp( context);
  }

  MaterialApp getMaterialApp(BuildContext context)   {
    return MaterialApp(

        title:  appName,
        color: StatusBarConstant.colorBackground,//Colors.green
        debugShowCheckedModeBanner: false,
        //scroll shadow : remove glow of scroll bar
        scrollBehavior: FastorScrollTheme(),

        //language direction RTL or LTR
        home: Directionality( // add this
          // textDirection: ui.TextDirection.rtl,
          textDirection: LanguageTools.getTextDirection(context),
          child:  getScaffold(),
        )

    );
  }


  Scaffold getScaffold() {
    return Scaffold(
      body:  home,
      resizeToAvoidBottomInset: true , //fix keyboard when open
    );
  }

  void initValues() {
    //set full width
    DeviceTools.initFullSize( context! );
    StatusBarConstant.initStatusBarValues( context! );
    NotchBarConstant.initNotchBarValues( context!);
  }


}