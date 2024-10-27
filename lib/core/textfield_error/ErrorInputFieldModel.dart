
import 'package:fastor_app_ui_widget/core/textfield_error/ErrorInputFieldGenerator.dart';

/**
    ErrorInputFieldArrayModel to print many errors to input filed at same time

    ------- example
    /// validate
    var errors = ErrorInputFieldArrayModel();
    if( ToolsValidation.isPhoneMobileValidAndEnglishLetter( loginRequest.phone  )  == false ) {
    errors.add(  "mobile",  "invalid phone number".tra() );
    }
    if( ToolsValidation.isPasswordValid( loginRequest.password  )  == false ) {
    errors.add( "password",  "invalid password".tra() );
    }
    if( errors.isFoundAnyError() ) {
    emit( LoginErrorState(  errors: errors.getError() ) );
    return;
    }
 */
class ErrorInputFieldArrayModel {

  List<ErrorInputFieldEntity> _list = [];

  add(String key, String message ) {
    _list.add( ErrorInputFieldEntity(key:  key , value: message )) ;
  }


  Map<String, dynamic> getError() {
    return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelTakeArray( _list );
  }

  bool isFoundAnyError(){
    return _list.isNotEmpty;
  }

}


class ErrorInputFieldEntity {

  String key;
  String value;

  ErrorInputFieldEntity({
    required this.key,
    required this.value
  });
}


