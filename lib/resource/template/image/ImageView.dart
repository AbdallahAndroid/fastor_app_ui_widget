
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/deviceChangeSize/ListenerChangeDeviceSize.dart';
import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/boarder/BorderRadiusTools.dart';

import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:log_debug/log_debug.dart';




@Deprecated( "use class 'ImageFastor()'")
class ImageView extends StatefulWidget {

  static String tag = "ImageView";

  //required
  double? myWidth = 0;
  double? myHeight = 0;
  ValueChanged<ImageViewState>? onChangeState;

  //optional
  AssetImage? assetAspectRatio;
  AssetImage? assetBackground ;
  String? urlAspectRation;
  String? urlBackground;

  double? radius_all = 0 ;
  double? radius_topLeft;
  double? radius_topRight ;
  double? radius_bottomLeft;
  double? radius_bottomRight;

  Color? colorBackground;
  EdgeInsets? padding;
  EdgeInsets? margin;
  double? opacity = 1;

  BoxFit? boxFit_background; //BoxFit.cover

  //responsive
  /**
   true: means i need to change size width/height while the browser size change
   */
  bool? responsive_auto = false ;

  Alignment?  gravityLayout_alignment = Alignment.center;

  VoidCallback? onPressed;


  ImageView( {
    required double  width,
    required double height,

    //src
    AssetImage? this.assetAspectRatio,
    AssetImage? this.assetBackground,
    String? this.urlAspectRation,

    //background
    String? this.urlBackground,
    Color? this.colorBackground,

    //radius
    double? this.radius_all ,
    double? this.radius_topLeft ,
    double? this.radius_topRight ,
    double? this.radius_bottomLeft ,
    double? this.radius_bottomRight ,

    //space
    EdgeInsets? this.padding,
    EdgeInsets? this.margin,

    //other
    double? this.opacity,
    Alignment? this.gravityLayout_alignment,
    bool? this.responsive_auto,
    BoxFit? this.boxFit_background,

    //call back
    VoidCallback? this.onPressed,
    ValueChanged<ImageViewState>? this.onChangeState
  }) {

    //set
    this.myWidth = width;
    this.myHeight = height;

  }

  @override
  ImageViewState createState() {
   // Log.k( "imageView",   "createState() - width: " + myWidth.toString() );

    var state = ImageViewState(
      widthNeeded: myWidth!,
      heightNeeded: myHeight!,

      assetAspectRatio:  assetAspectRatio,
      assetBackground: assetBackground,
      urlAspectRation: urlAspectRation,
      urlBackground: urlBackground,
      radius_all: radius_all,
      radius_topLeft: radius_topLeft,
      radius_topRight: radius_topRight,
      radius_bottomLeft: radius_bottomLeft,
      radius_bottomRight: radius_bottomRight,
      colorBackground: colorBackground,
      padding: padding,
      margin: margin,
      opacity: opacity,
        responsive_auto : responsive_auto,
        onPressed : onPressed,
      gravityLayout_alignment: gravityLayout_alignment
    );

    if(onChangeState != null ) onChangeState!(state);
    return state;
  }


}

class ImageViewState extends State<ImageView> {

  String tag = "ImageTemplateState";

  //------------------------------------------------------ constructor

  //required
  double width = 0;
  double height = 0;

  //optional
  AssetImage? assetAspectRatio;
  AssetImage? assetBackground ;
  String? urlAspectRation;
  String? urlBackground;

  double? radius_all = 0 ;
  double? radius_topLeft;
  double? radius_topRight ;
  double? radius_bottomLeft;
  double? radius_bottomRight;

  Color? colorBackground;
  EdgeInsets? padding;
  EdgeInsets? margin;
  double? opacity   ;
  bool? responsive_auto = false ;

  //gravity
  Alignment? gravityLayout_alignment = Alignment.center;

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

  ImageViewState( {
    required double  widthNeeded,
    required double  heightNeeded,
    VoidCallback? this.onPressed,
    AssetImage? this.assetAspectRatio,  //src
    AssetImage? this.assetBackground,
    String? this.urlAspectRation, //src
    String? this.urlBackground,
    double? this.radius_all ,
    double? this.radius_topLeft ,
    double? this.radius_topRight ,
    double? this.radius_bottomLeft ,
    double? this.radius_bottomRight ,
    Color? this.colorBackground,
    EdgeInsets? this.padding,
    EdgeInsets? this.margin,
    double? this.opacity,
    Alignment? this.gravityLayout_alignment,
    bool? this.responsive_auto
  }) {

    // set value
    width = widthNeeded ;
    height = heightNeeded;

  }


  //----------------------------------------------------------------------- public : set image Url

  void setImageBackgroundUrl(String updateUrl ) {
    // Log.i( "setImage() update: " + update.image.toString() );
    setState(() {
      this.urlBackground = updateUrl;
    });
  }


  void setImageAspectRationUrl(String updateUrl ) {
    // Log.i( "setImage() update: " + update.image.toString() );
    setState(() {
      this.urlAspectRation = updateUrl;
    });
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
      Align( child: getViewMode_aspectRatio(), alignment: Alignment.center  ),

      //image
      getViewMode_background()


    ],);

    var  sizeBox = SizedBox(child:  stack, width: width, height: height );
    return sizeBox;
  }

  //------------------------------------------------------------- fix change size device

  void _autoResponsive(){
    //check not need
    if( responsive_auto == false ){
      return;
    }

    //
    ListenerChangeDeviceSize( context,
        orginal_width: width,
        orginal_height: height,
        changeCallBack: (widthNew, heightNew) {
          width = widthNew;
          height = heightNew ;

          //refresh
          setState(() {

          });
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
    radius_all ??= 0;
    boarderRadius = BorderRadiusTools.get(
      radius_all: radius_all,
      radius_topLeft: radius_topLeft,
      radius_topRight: radius_topRight,
      radius_bottomLeft: radius_bottomLeft,
      radius_bottomRight: radius_bottomRight,
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

  Widget getViewMode_background() {
    //check not found background
    if( isModeBackground == false  ) {
      return EmptyView.zero();
    }

    //init type
    _setImageProvider_mode_background();

    //return view
    var cont =   Container(
      alignment: gravityLayout_alignment,
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
             fit: getBoxFit_background()
             //fit:  BoxFit.fill, // like android not crop
            //fit:  BoxFit.cover,  //make crop the image to be good quality , even it crop
          )
      ),
    );

    return clickOnThisArea(cont);
  }


  BoxFit getBoxFit_background(){

    //check have custome
    if( widget.boxFit_background != null ) {
      return widget.boxFit_background!;
    }

    return BoxFit.fill;
  }

  Widget getViewMode_aspectRatio() {
    //check not found background
    if( isModeAspectRatio == false  ) {
      return EmptyView.zero();
    }

    //init type
    _setImageProvider_mode_aspectRatio();

    //Log.k(tag,  "getViewMode_aspectRatio() - boarderRadius: " + boarderRadius.toString() );

    //return view
    var cont =   Container(
      alignment: gravityLayout_alignment,
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
              fit: chooseFitBox(),

          )),
    );

    var sizeBox = SizedBox(child:  cont,
      width:  EdgeInsetsTools.getNetSizeAfterPadding(width, padding!),
      height:  EdgeInsetsTools.getNetSizeAfterPadding(height, padding!)
    );


    return clickOnThisArea(sizeBox);
  }



  //------------------------------------------------------------- setter image provider

  void _setImageProvider_mode_aspectRatio() {
    if( urlAspectRation != null   ) {
      imageProviderChoosed =  _getImageProvider_url_aspectRatio();
    } else  {
      imageProviderChoosed =  assetAspectRatio!;
    }
  }


  void _setImageProvider_mode_background() {
    if( urlBackground != null   ) {
      imageProviderChoosed =  _getImageProvider_url_background();
    } else {
      imageProviderChoosed =  assetBackground!;
    }
  }

  //------------------------------------------------------------ ImageProvider getter

  ImageProvider _getImageProvider_url_aspectRatio() {
    return  CachedNetworkImageProvider(urlAspectRation!);
  }


  ImageProvider _getImageProvider_url_background( ){
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
