
import 'package:flutter/material.dart';

/// Manage the state of the application
///
/// Get current state just call method "FastorStateManagement.instance().getCurrentState()"
///  it's return state of map
///
/// To can use this library must to make all pages use class "PageTemplate"
class FastorStateManagement {

  //---------------------------------------------------------------- varaible

   static Map<String, State> _mapState = Map();


  //--------------------------------------------------------------- single tone

  FastorStateManagement._();

  static bool _isSync = false;

  ///single tone design pattern
  static FastorStateManagement instance(){
    if( _isSync == false ) {
      _isSync = true;
    }
    return FastorStateManagement._();
  }

  //------------------------------------------------------------------- setter

  void addState(State newState ) {
    _mapState[ newState.toString( ) ] = newState;
  }

   //------------------------------------------------------------------- getter

   ///get current page State
   State? getCurrentState()  {
     State? resultState ;

    //loop
    _mapState.forEach((keyLoop, stateLoop) {

      bool result = stateLoop.mounted;

      //log
      // print( "getCurrentState()  - keyLoop: " + keyLoop + " /value: " + value.toString() + " /isMounted: " + result.toString() );
      if( result ) {
        resultState = stateLoop  ;
        return ;
      }
   });
     print( "getCurrentState()  - resultState: " + resultState.toString()    );
    return resultState;

    // //result
    // var resultState  = _mapState[ keyMounted ];
    // print( "getCurrentState()  - resultState: " + resultState.toString() + " /keyMounted: " + keyMounted.toString()  );
    // return resultState;
  }


  ///get current page context
   BuildContext? getCurrentContext()  {
    var myState = getCurrentState();
    if( myState == null ) return null;
    if( myState.mounted == false ) return null;
     return myState.context;
   }


   /// check if the Flutter application is in the foreground
  bool isAppForeground(){
    State? myState = getCurrentState();
    return myState != null;
  }


   Map<String, State> getAllStates(){
    return _mapState;
   }


   Future clearAllState() async {
     //loop
     _mapState.forEach((keyLoop, value) {

       value.dispose();
     });
   }

   Future clearAllContext() async {
     //loop
     _mapState.forEach((keyLoop, value) {

       Navigator.pop( value.context );
     });
   }

}