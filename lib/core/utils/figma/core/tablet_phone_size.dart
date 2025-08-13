
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/ProjectFigmaScreenInitializer.dart';
import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

extension TabletSizePhone on num  {

  ///::::::::::::::::::::::::::::: exact same figma size

  /// this calculate exact same figma size
  double get wTabletLandscapeExact {
    double ratio = ( this / ProjectFigmaScreenInitializer.figmaScreenLandscapeWidth );
    var result =  ratio * currentDeviceHeight;
    // Log.i("wTabletLandscapeExact() - this: $this /currentDeviceHeight: $currentDeviceHeight /ratio: $ratio /result: $result ");
    return result;
  }


  /// this calculate exact same figma size
  double get hTabletLandscapeExact {
    double ratio = ( this / ProjectFigmaScreenInitializer.figmaScreenLandscapeHeight );
    var result =  ratio * currentDeviceWidth;
    return  result;
  }

  ///::::::::::::::::::::::::::::: detect orientation

  /// "wt"  symbol for  "width tablet"
  double get wt {
    if(GlobalApp.getContexts()  != null ) {
      bool isLandScapeNow =   DeviceTools.isLandscape( GlobalApp.getContexts()! )  ;
      return isLandScapeNow ? _wTabletLandscape : _wTabletPortrait;
    } else {
      return _wTabletLandscape;
    }
  }


  /// "ht"  symbol for "height tablet"
  double get ht {
    if(GlobalApp.getContexts()  != null ) {
      bool isLandScapeNow =   DeviceTools.isLandscape( GlobalApp.getContexts()! )  ;
      return isLandScapeNow ? _hTabletLandscape : _hTabletPortrait;
    } else {
      return _hTabletLandscape;
    }
  }

  ///::::::::::::::::::::::::::::: specific orientation

  double get _wTabletLandscape {
    /// validate tablet only
    if( isTablet ==false ){ return Figma.w( numTDouble() ) ; }
    return _widthLogicTabletSize( numTDouble() ) ;
  }

  double get _hTabletLandscape {
    /// validate tablet only
    if( isTablet ==false ){ return Figma.h( numTDouble() ) ; }
    return _heightLogicTabletSize( numTDouble() ) ;
  }

  double get _wTabletPortrait {
    /// validate tablet only
    if( isTablet ==false ){ return Figma.w( numTDouble() ) ; }
    return _heightLogicTabletSize( numTDouble() )  ;
  }
  double get _hTabletPortrait  {
    /// validate tablet only
    if( isTablet ==false ){ return Figma.h( numTDouble() ) ; }
    return _widthLogicTabletSize( numTDouble() ) ;
  }

  ///::::::::::::::::::::::::::::: private

  double numTDouble(){
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