
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:flutter/material.dart';

import 'DeviceSizeChangeBase.dart';

/**
 * fix when device screen change
 */
class ListenerChangeDeviceSize   {


  static String tag =   "ListenerChangeDeviceSize";

  //info
  DeviceSizeChangeCallBack changeCallBack;
  // Widget child;

  //orginal
  double orginal_width;
  double orginal_height;

  //full screen
  double fullScreen_width = 0;
  double fullScreen_height = 0 ;

  //context
  late BuildContext _contextCreatedPage;

  //ratio
  double percentange_orginal_width = 0; //percentage width between orginal and fullScreen
  double percentange_orginal_height = 0; //percentage width between orginal and fullScreen

  //update new size after screensize changed
  double newSize_width = 0;
  double newSize_height = 0;

  /**
   when this page context it's means i need to stop change size
  */
  late BuildContext currentPageContext;

  ListenerChangeDeviceSize(BuildContext context, {
    required double this.orginal_width,
    required double this.orginal_height,
    // required Widget this.child,
    required DeviceSizeChangeCallBack this.changeCallBack
}) {

    _contextCreatedPage = context;
    currentPageContext = context;

    _build();
  }

  //------------------------------------------------------------ public methods

  void updatePageContext(BuildContext up){
    currentPageContext = up;
  }

  //---------------------------------------------------------- BUID

  void _build( ) {
    _initValues();
    _listenerFullDeviceChange();
  }


  void _initValues(){
    _setFullScreenHeightOnBuildView();
    _calculatePercentage();

  }



  void _setFullScreenHeightOnBuildView(){
    fullScreen_width = DeviceTools.getWidth( _contextCreatedPage);
    fullScreen_height = DeviceTools.getHeight( _contextCreatedPage );
  }


  void _calculatePercentage(){
    percentange_orginal_width = orginal_width / fullScreen_width;
    percentange_orginal_height = orginal_height / fullScreen_height;
    // Log.k(tag,  "calculatePercentage() - orginal_width: " + orginal_width.toString() );
    // Log.k(tag,  "calculatePercentage() - fullScreen_width: " + fullScreen_width.toString() );
    // Log.k(tag,  "calculatePercentage() - percentange_orginal_width: " + percentange_orginal_width.toString() );
  }

  //---------------------------------------------------------------- listener screen size change

  /**
   * this happened on website, when mobile change the size of screen
   */
  void _listenerFullDeviceChange(){
    DeviceSizeChangeBase.addListenerToChange( callBack:  (w, h)  {

      //Log.k(tag,  "listenerFullDeviceChange() - fullScreen_width: " + fullScreen_width.toString() );

      //validate
      if( _validateChange(w, h ) == false ) {
        return ;
      }

      //now
      _updateNewSize(w, h );

    } );
  }

  //---------------------------------------------------------------- update new size

  bool _validateChange(double w, double h ) {
    if( w == 0 ) return false;
    if( h == 0) return false;

    //check page change, by open another page
    /**
        This error happens if you call setState() on a State object for a widget that no longer appears in the widget tree
     */
    if( _contextCreatedPage != currentPageContext ) {
    //  Log.i( "_validateChange() - _contextCreatedPage != MyApplication.getContext() "  );
      return false;
    }

    //good
    return true;
  }

  _updateNewSize(double w, double h ){
    _updateFullScreenSize(w, h);
    _calculateNewSize(w, h);
    callCalBack();
  }

  void _calculateNewSize(double w, double h) {
    newSize_width = percentange_orginal_width * fullScreen_width;
    newSize_height = percentange_orginal_height * fullScreen_height;
  }

  void _updateFullScreenSize(double w, double h ){
    fullScreen_width = w;
    fullScreen_height = h;
  }


  callCalBack(){
    //Log.k(tag,  "callCalBack() - newSize_width: " + newSize_width.toString()  ); // " /newSize_height: " + newSize_height.toString() );
    changeCallBack( newSize_width, newSize_height);
  }


}