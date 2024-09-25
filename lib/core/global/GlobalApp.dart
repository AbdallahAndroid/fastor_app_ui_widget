import 'package:flutter/material.dart';

/// declare "rootScaffoldMessengerKey" at MaterialApp()
/// MaterialApp(
///              scaffoldMessengerKey: rootScaffoldMessengerKey,
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

BuildContext? getContextGlobal(){ return rootScaffoldMessengerKey.currentState?.context; }
