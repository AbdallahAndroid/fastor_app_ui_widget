
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';

import 'failures.dart';

class HandleErrorMessageHelper {

  static String  mapFailureGeneralToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case InputFieldsInvalidFailure:
        {
          var failureMessage = failure as InputFieldsInvalidFailure;
          return failureMessage.message??"Failed".tra() ;
        }
      case ServerMessageFailure:
        {
          var failureMessage = failure as ServerMessageFailure;
          return failureMessage.message;
        }
      default:
        return "Failed".tra();
    }
  }



}