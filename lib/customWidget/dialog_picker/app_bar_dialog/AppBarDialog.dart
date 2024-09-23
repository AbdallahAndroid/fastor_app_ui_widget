import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';

class AppBarDialog extends StatelessWidget {

  BuildContext contextDialog;
  String title;

  AppBarDialog({
    required this.contextDialog,
    required this.title
});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: DeviceTools.getWidth(contextDialog), height: Figma.w( 25),
        // color: Colors.green,
        child: stackContent(),
    ) ;
  }

  Widget stackContent(){
    return Stack(children: [
      Container( width: DeviceTools.getWidth(contextDialog), height: Figma.w( 25) , color: Colors.transparent,),
      PositionedApp.langApp(child: titleWidget(), left: 0, top: 0, bottom: 0),
      PositionedApp.langApp(child: cancelWidget(), right: 0, top: 0, bottom: 0),
    ],
    );
  }

  Widget titleWidget(){
    return TextApp(title, color:  Colors.black, fontSize: 15 ,);
  }


  Widget cancelWidget(){
    var image =  ImageApp(
      context: contextDialog,
      width: Figma.w( 14),
      height: Figma.w( 14) ,
      assetAspectRatio: AssetImage("assets/images/cancel_icon.png"),
      // onPressed: (){
      //   Navigator.pop(contextDialog);
      // },
    );

    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric( horizontal: Figma.w( 10) ),
        child: image,
      ),
      onTap: (){
        Navigator.pop(contextDialog);
      },
    );
  }

}