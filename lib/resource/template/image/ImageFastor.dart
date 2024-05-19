//
import 'package:flutter/material.dart';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:fastor_app_ui_widget/core/device/deviceChangeSize/ListenerChangeDeviceSize.dart';

import 'package:fastor_app_ui_widget/core/boarder/BorderRadiusTools.dart';

import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:log_debug/log_debug.dart';



class ImageFastor extends StatelessWidget  {


  String tag = "ImageViewFastor";

  //------------------------------------------------------ constructor

  BuildContext context;

  //required
  double width = 0;
  double height = 0;

  //optional
  AssetImage? assetAspectRatio;
  AssetImage? assetBackground ;
  String? urlAspectRation;
  String? urlBackground;

  double? radiusAll = 0 ;
  double? radiusTopLeft;
  double? radiusTopRight ;
  double? radiusBottomLeft;
  double? radiusBottomRight;

  Color? colorBackground;
  EdgeInsets? padding;
  EdgeInsets? margin;
  double? opacity   ;
  bool? responsiveAuto = false ;
  BoxFit? boxFitBackground;

  //gravity
  Alignment? gravityLayoutAlignment = Alignment.center;

  //radius
  late BorderRadius boarderRadius;

  // is url or asseat found
  bool isAssestFound = false;
  bool isUrlFound = false;
  @Deprecated( "not at this version")
  bool isBothUrlAndAssetFound = false;

  //mode
  bool isModeAspectRatio = false;
  bool isModeBackground = false;
  bool isModeBoth = false;  //both "isModeAspectRatio" and "isModeBackground"

  VoidCallback? onPressed;

  ImageFastor( {
    required this.context,
    required double  this.width,
    required double  this.height,
    VoidCallback? this.onPressed,
    AssetImage? this.assetAspectRatio,  //src
    AssetImage? this.assetBackground,
    String? this.urlAspectRation, //src
    String? this.urlBackground,
    double? this.radiusAll ,
    double? this.radiusTopLeft ,
    double? this.radiusTopRight ,
    double? this.radiusBottomLeft ,
    double? this.radiusBottomRight ,
    Color? this.colorBackground,
    EdgeInsets? this.padding,
    EdgeInsets? this.margin,
    double? this.opacity,
    Alignment? this.gravityLayoutAlignment,
    bool? this.responsiveAuto,
    BoxFit? this.boxFitBackground
  });


  //----------------------------------------------------------------------- public : set image Url

  void setImageBackgroundUrl(String updateUrl ) {
    // Log.i( "setImage() update: " + update.image.toString() );
    // setState(() {
    this.urlBackground = updateUrl;
    // });
  }


  void setImageAspectRationUrl(String updateUrl ) {
    // Log.i( "setImage() update: " + update.image.toString() );
    // setState(() {
    this.urlAspectRation = updateUrl;
    // });
  }

  //---------------------------------------------------------------- public : is visible

  bool isVisibleWidget(BuildContext context){
    try {
      bool isFound = context != null;
      return isFound;
    } on Error catch(er){
      LogDebug.k(tag, "isVisibleWidget()  Error "   + er.toString()  );
      return false;
    } on Exception catch(ex){
      LogDebug.k(tag, "isVisibleWidget()  Exception "   + ex.toString()  );
      return false;
    }
  }
  //-------------------------------------------------------- public method

  late ImageProvider imageProviderChoosed;


  //------------------------------------------------------ build

  @override
  Widget build(BuildContext context) {
    // Log.k(tag, "build()  image.width: " + width.toString()  );

    //init
    initValues();
    _autoResponsive();


    return getContent();
  }


  Widget getContent() {

    var stack =  Stack( children: [

      //size
      EmptyView.colored( width , height,  colorBackground!),

      /**
       * why make mode "aspectRation" behind the mode "background" ?
       *    - answer: i use the asset of "aspectRatio" as the placeholder
       */
      Align( child: getViewModeAspectRatio(), alignment: Alignment.center  ),

      //image
      getViewModeBackground()


    ],);

    var  sizeBox = SizedBox(child:  stack, width: width, height: height );
    return sizeBox;
  }

  //------------------------------------------------------------- fix change size device

  void _autoResponsive(){
    //check not need
    if( responsiveAuto == false ){
      return;
    }

    //
    ListenerChangeDeviceSize( context,
        orginal_width: width,
        orginal_height: height,
        changeCallBack: (widthNew, heightNew) {
          width = widthNew;
          height = heightNew ;

          // //refresh
          // setState(() {
          //
          // });
        }
    );
  }

  //-------------------------------------------------------------   init values

  void initValues() {
    //check what found
    chooseUrl();
    chooseAssetName();
    initIsBoth();


    //set default color
    colorBackground ??= Colors.transparent;

    //set deafult space
    padding ??= EdgeInsets.zero;
    margin ??= EdgeInsets.zero;

    //radius
    radiusAll ??= 0;
    boarderRadius = BorderRadiusTools.get(
      radius_all: radiusAll,
      radius_topLeft: radiusTopLeft,
      radius_topRight: radiusTopRight,
      radius_bottomLeft: radiusBottomLeft,
      radius_bottomRight: radiusBottomRight,
    );
  }


  void initIsBoth() {
    if( isModeBackground &&  isAssestFound ) {
      isModeBoth = true;
    }
    if ( isUrlFound && isAssestFound ) {
      isBothUrlAndAssetFound = true;
    }
  }

  //-------------------------------------------------------  Widget

  Widget getViewModeBackground() {
    //check not found background
    if( isModeBackground == false  ) {
      return EmptyView.zero();
    }

    //init type
    _setImageProviderModeBackground();

    //return view
    var cont =   Container(
      alignment: gravityLayoutAlignment,
      padding: padding,
      // margin: margin,
      width: width,
      height: height,
      child: EmptyViewSizeImage(), //EmptyView.empty(width, height),
      decoration: BoxDecoration(
          borderRadius: boarderRadius,
          color: colorBackground,
          image: DecorationImage(
              image: imageProviderChoosed,
              fit: getBoxFitBackground()
            //fit:  BoxFit.fill, // like android not crop
            //fit:  BoxFit.cover,  //make crop the image to be good quality , even it crop
          )
      ),
    );

    return clickOnThisArea(cont);
  }


  BoxFit getBoxFitBackground(){

    //check have customer
    if( boxFitBackground != null ) {
      return   boxFitBackground!;
    }

    return BoxFit.fill;
  }

  Widget getViewModeAspectRatio() {
    //check not found background
    if( isModeAspectRatio == false  ) {
      return EmptyView.zero();
    }

    //init type
    _setImageProviderModeAspectRatio();

    //Log.k(tag,  "getViewMode_aspectRatio() - boarderRadius: " + boarderRadius.toString() );

    //return view
    var cont =   Container(
      alignment: gravityLayoutAlignment,
      padding: padding,
      // margin: margin,
      width: width,
      height: height,
     child:  EmptyViewSizeImage(),
          decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: boarderRadius,
          image: DecorationImage(
          image: imageProviderChoosed,
          fit:  BoxFit.contain,

          )),


    );

    var sizeBox = SizedBox(child:  cont,
        width:  width + padding!.left + padding!.right,
        height:   height +  padding!.top + padding!.bottom
    );

    return clickOnThisArea(sizeBox);
  }



  //------------------------------------------------------------- setter image provider

  void _setImageProviderModeAspectRatio() {
    if( urlAspectRation != null   ) {
      imageProviderChoosed =  _getImageProviderUrlAspectRatio();
    } else  {
      imageProviderChoosed =  assetAspectRatio!;
    }
  }


  void _setImageProviderModeBackground() {
    if( urlBackground != null   ) {
      imageProviderChoosed =  _getImageProviderUrlBackground();
    } else {
      imageProviderChoosed =  assetBackground!;
    }
  }

  //------------------------------------------------------------ ImageProvider getter

  ImageProvider _getImageProviderUrlAspectRatio() {
    return  CachedNetworkImageProvider(urlAspectRation!);
  }


  ImageProvider _getImageProviderUrlBackground( ){
    return CachedNetworkImageProvider(urlBackground!);
  }


  //------------------------------------------------------------ choose url, choose asset

  static bool isValid(String? str)
  {
    if (str == null) {
      return false;
    }
    if (str.length == 0) {
      return false;
    }
    if (str == "") {
      return false;
    }
    if (str == "null") {
      return false;
    }
    if ("null" == str.trim().toLowerCase()) {
      return false;
    }
    if (str == " ") {
      return false;
    }
    return true;
  }

  String chooseUrl() {
    if( isValid(urlAspectRation)   ) {
      isUrlFound = true;
      isModeAspectRatio = true;
      return urlAspectRation!;

    } else if (  isValid( urlBackground) ){
      // Log.k(tag,  "chooseUrl()  - isValid( urlBackground) - urlBackground: " + urlBackground.toString() );
      isUrlFound = true;
      isModeBackground = true;
      return urlBackground!;

    } else {
      isUrlFound = false;
      return "";
    }
  }


  String chooseAssetName() {
    if( assetAspectRatio != null  ) {
      isAssestFound  = true;
      isModeAspectRatio = true;
      return assetAspectRatio!.assetName;

    } else if (  assetBackground != null ){
      isAssestFound  = true;
      isModeBackground = true;
      return assetBackground!.assetName;

    } else {
      isAssestFound  = false;
      return "";
    }
  }

  //----------------------------------------------------------------- box fit

  BoxFit chooseFitBox() {
    if(  height > width ) {
      return BoxFit.fitWidth;
    } else {
      return BoxFit.fitWidth;
    }
  }


  //----------------------------------------------------------------- surround

  Widget EmptyViewSizeImage() {
    return EmptyView.empty(width, height);
  }


  Widget clickOnThisArea( Widget cont ) {


    if( onPressed == null ) {
      return setSurroundWidget(cont);
    }

    var clickView =  GestureDetector(child:  cont,
      onTap: (){
        // Log.i( "clickOnThisArea() - onPressed: " + onPressed.toString() );
        if( onPressed !=null ) onPressed!();
      },
    );

    //set margin here after click done
    return setSurroundWidget(clickView);
  }



  Widget setSurroundWidget(Widget view ) {
    //margin
    var mar =  Container( child:  view, margin: margin  );

    //opacity
    return setOpacity(mar);
  }


  Widget setOpacity(Widget view){
    if( opacity == null ) return view;

    return Opacity(opacity: opacity!, child:  view );
  }

  //-------------------------------------------------------- s

  String? getUrlVailed(){
    if(  isValid( urlBackground ) ) {
      return urlBackground;
    } else {
      return urlAspectRation;
    }
  }


}