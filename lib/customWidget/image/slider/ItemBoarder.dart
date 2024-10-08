
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/text_custom/TextCustomSemiBold.dart';
import 'package:flutter/material.dart';

class ItemBoarder extends StatelessWidget {

  BuildContext? context;

  int index;
  String? assetsName;
  String? imageUrl;
  String? title;
  double? width;
  double? height;


  ItemBoarder( {
    required this.index,
    this.assetsName,
    this.imageUrl,
    this.title,
    this.width,
    this.height
});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Stack(children: [
      imageBackground(),
      if(title != null ) titleWidget()
    ],);
  }


  Widget imageBackground(){
    return ImageApp(
      context: context!,
      width: width?? DeviceTools.getWidth(context!),
      height:  height??DeviceTools.getHeight(context!),
      assetAspectRatio: imageUrl != null ? logoAssetDefault() : null ,
      assetBackground: assetsName != null ? AssetImage( assetsName!) : null ,
      urlBackground: imageUrl,
      boxFitBackground: BoxFit.cover,
      colorBackground: Colors.black,
    );
  }

  titleWidget() {
    return Container(
      child: TextCustomSemiBold( title??"" , color: Colors.white ),
      margin: EdgeInsets.only( left:  20, right: 20, top: 60 ),
    );
  }

  AssetImage logoAssetDefault(){
    return AssetImage( "assets/images/placeholder_logo_square.png"
    );
  }


}