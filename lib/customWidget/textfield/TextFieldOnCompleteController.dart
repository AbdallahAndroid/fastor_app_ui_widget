import 'dart:async';

typedef OnCompleteWritingCallback = Function(String textWritten );

class TextFieldOnCompleteController {

  Timer? _debounceTimer;
  String lastEdition = "";
  OnCompleteWritingCallback? callback;

  onChange(String? s , {required OnCompleteWritingCallback callback}) {
    this.callback = callback;

    _timerAgain(s??"" );
  }


  _timerAgain(String input ){
    lastEdition = input;
    // Cancel the previous timer if it's still active
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    // Set up a new timer that triggers after 1000 milliseconds
    _debounceTimer = Timer(Duration(milliseconds: 1000), () {
      if (input == lastEdition) {
        if(callback != null ) callback!(input);
      }
    });
  }


}