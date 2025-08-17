import 'dart:io';

import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/responsive_views/helper/ResponsiveApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
Future initOrientationByChooseAppType({BuildContext? context, String? logFrom}) async{

  /// init optional context
  BuildContext? contextNullable = context;
  contextNullable ??= GlobalApp.getContexts();
  Log.i("orientation - initOrientationByChooseAppType() -  logFrom: $logFrom");

  /// case isTablet
  if(  contextNullable != null ) {
    bool isTablet =   ResponsiveApp.isTablet( contextNullable);
    if( isTablet ) {
      await _landscapeOrientation();
    } else {
      await _defaultPortraitOrientation();
    }
  } else {
    if( isTabletWithoutContext() ) {
      await _landscapeOrientation();
    } else {
      await _defaultPortraitOrientation();
    }

  }
}


bool isTabletWithoutContext() {
  final size = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  final shortestSide = size.shortestSide;
    Log.i("orientation - isTabletWithoutContext() -  shortestSide: $shortestSide");
    return shortestSide >= 550 ;
}


Future _defaultPortraitOrientation()  async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Log.i( "orientation -  _defaultPortraitOrientation()");
}


Future _landscapeOrientation()  async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);
  Log.i( "orientation -_landscapeOrientation()");
}