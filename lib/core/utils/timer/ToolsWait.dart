import 'dart:async';

class ToolsWait {

  static waitToDo(int mili , Function() callback) {
    // Log.i("waitToDo - waitToDo() - start" );
    Timer(Duration(milliseconds: mili), () {
      //  Log.i("waitToDo - waitToDo() - end" );
      callback();
    });
  }


}