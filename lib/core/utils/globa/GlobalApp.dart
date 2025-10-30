import 'package:flutter/material.dart';

/// declare "rootScaffoldMessengerKey" at MaterialApp()
/// MaterialApp(
///              scaffoldMessengerKey: rootScaffoldMessengerKey,
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

BuildContext? getContextGlobal(){ return rootScaffoldMessengerKey.currentState?.context; }

/// set at
///            return MaterialApp(
///               navigatorKey: rootNavigatorKey,
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class GlobalApp {

  static BuildContext? getContexts(){ return getContextGlobal(); }

  static BuildContext getContextForceUnWarp(){ return getContextGlobal()!; }

  static BuildContext? getNavigatorContext(){ return rootNavigatorKey.currentState?.context; }
}
