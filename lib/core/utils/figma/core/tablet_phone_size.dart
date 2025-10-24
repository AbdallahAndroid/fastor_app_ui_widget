
import 'dart:math';

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/ProjectFigmaScreenInitializer.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/portrait_phone_size.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/scale_text.dart';
import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';

extension TabletSizePhone on num  {

  ///;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; text

  double get spt {
    return spTablet;
  }

  double get spTablet {
    if(GlobalApp.getContexts()  != null ) {
      bool isPortrait =   DeviceTools.isPortraitNotSemiBox( GlobalApp.getContexts()! )  ;
      if(isPortrait ) return  numToDouble().spPortrait ;

      return  hTabletInputField; // min( min( ht, wt ) , min( hTabletLandscapeExact, wTabletLandscapeExact )  ) ;
    } else {
      return _hTabletLandscape;
    }
  }


  ///::::::::::::::::::::::::::::: exact same figma size

  /// this calculate exact same figma size
  double get wTabletLandscapeExact {
    // double ratio = ( this / ProjectFigmaScreenInitializer.figmaScreenLandscapeWidth );
    // var result =  ratio * currentDeviceHeight;
    // Log.i("wTabletLandscapeExact() - this: $this /currentDeviceHeight: $currentDeviceHeight /ratio: $ratio /result: $result ");
    return PortraitPhoneSize.widthPortrait( numToDouble() );
  }


  /// this calculate exact same figma size
  double get hTabletLandscapeExact {
    // double ratio = ( this / ProjectFigmaScreenInitializer.figmaScreenLandscapeHeight );
    // var result =  ratio * currentDeviceWidth;
    return PortraitPhoneSize.heightPortrait( numToDouble() );
  }

  ///::::::::::::::::::::::::::::: case: input field size

  /// "wt"  symbol for  "width tablet"
  ///    >> usage 1: example input field widths >> , make in landscape same width in portrait
  double get wTabletInputField {
    if(GlobalApp.getContexts()  != null ) {
      bool isLandScapeOrSemibBox =   DeviceTools.isLandscapeOrSemiBox( GlobalApp.getContexts()! )  ;
      return isLandScapeOrSemibBox ? hTabletInputField  : PortraitPhoneSize.widthPortrait( numToDouble() );
    } else {
      return _wTabletLandscape;
    }
  }


  /// "ht"  symbol for "height tablet"
  double get hTabletInputField {
    if(GlobalApp.getContexts()  != null ) {
      bool isLandScapeOrSemibBox =   DeviceTools.isLandscapeOrSemiBox( GlobalApp.getContexts()! )  ;
      return isLandScapeOrSemibBox ? _hTabletLandscape : _hTabletPortrait;
    } else {
      return _hTabletLandscape;
    }
  }

  ///::::::::::::::::::::::::::::: specific orientation

  double get _wTabletLandscape {
    /// validate tablet only
    if( isTablet ==false ){ return PortraitPhoneSize.widthPortrait( numToDouble() ) ; }
    return _widthLogicTabletSize( numToDouble() ) ;
  }

  double get _hTabletLandscape {
    /// validate tablet only
    if( isTablet ==false ){ return PortraitPhoneSize.heightPortrait( numToDouble() ) ; }
    return _heightLogicTabletSize( numToDouble() ) ;
  }

  double get _wTabletPortrait {
    /// validate tablet only
    if( isTablet ==false ){ return PortraitPhoneSize.widthPortrait( numToDouble() ) ; }
    return _heightLogicTabletSize( numToDouble() )  ;
  }
  double get _hTabletPortrait  {
    /// validate tablet only
    if( isTablet ==false ){ return PortraitPhoneSize.heightPortrait( numToDouble() ) ; }
    return _widthLogicTabletSize( numToDouble() ) ;
  }

  ///::::::::::::::::::::::::::::: private

  double numToDouble(){
    double d = 0;
    if( this.toString().contains( ".") ) {
      d =  double.parse("$this") ;
    } else {
      d =  double.parse("$this.0") ;
    }
    return d;
  }

  ///::::::::::::::::::::::::::::: logic tablelt


  /// example case figma size width is 400, while tablet width is 800
  ///   means  result ratio is 0.5
  static double  _getDeviceRatioWithFigmaScreenFixedSize()  {
    double ratio = (  ProjectFigmaScreenInitializer.figmaScreenLandscapeWidth / currentDeviceWidth   );
    // Log.i("getDeviceRatioWithFigmaScreenFixedSize() - ratio: $ratio /isTablet: $isTablet");
    return ratio;
  }


  static double _widthLogicTabletSize( double figmaSize ) {
    double ratio = ( figmaSize / ProjectFigmaScreenInitializer.figmaScreenLandscapeHeight );
    return  ratio * currentDeviceWidth * _getDeviceRatioWithFigmaScreenFixedSize() ;
  }

  static  double _heightLogicTabletSize ( double figmaSize ) {
    double ratio = ( figmaSize / ProjectFigmaScreenInitializer.figmaScreenLandscapeWidth );
    return  ratio * currentDeviceWidth * _getDeviceRatioWithFigmaScreenFixedSize()  ;
  }


}