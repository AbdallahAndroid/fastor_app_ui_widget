import 'dart:async';

typedef OnCompleteWritingCallback = Function(String textWritten );

/**
----------------------------- how to use

    0- declare at instance scope
    var onCompleteHandler = TextFieldOnCompleteController();

    1- at widget textfield fire
    return TextFieldApp(

    onChanged: (s){

      onChangeHappenedOrOnSubmitButtonClicked(searchController.text);
    },
    );

    2-  fire action
    onChangeHappenedOrOnSubmitButtonClicked(String s ) {
      onCompleteHandler.onChange(s,  callback: (textWritten) {
          widget.onCompleted(textWritten);
      });
    }


 */
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