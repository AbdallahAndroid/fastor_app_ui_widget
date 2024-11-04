
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/textfield_error/ErrorInputFieldGenerator.dart';
import 'package:fastor_app_ui_widget/core/textfield_error/ErrorInputFieldModel.dart';
import 'package:fastor_app_ui_widget/core/textfield_error/error_message/ErrorMessageTextConstant.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';

/**
    /// used when button login click "if(validateLogin() == false   ) return;"
    bool validateLogin(  ) {
    var errors = ErrorMessageTextFieldValidation.form(
    phone: loginRequest.phone??"",
    password: loginRequest.password??"",
    );
    if( errors != null ) {
    emit( LoginErrorState(  errors:  errors ) );
    return false ;
    }
    emit( AuthInitialState(  ) );
    return true ;
    }

 */

class ErrorMessageTextFieldValidation {

  static String tag = "ErrorMessageTextFieldValidation";

  //------------------------------------------------------------ error array

  static Map<String, dynamic>? form({
    String? name,
    String? email,
    String? phone,
    String? otp,
    String? password,
    String? passwordConfirm,
    String? nationalIdSaudi,
    bool? isNationalIdOptionalForever
  }) {

    isNationalIdOptionalForever ??= false;

    var errors = ErrorInputFieldArrayModel();

    /// name
    if( name != null ) {
      if(ToolsValidation.isEmpty( name  ) ) {
        errors.add( "name",  ErrorMessageTextConstant.nameEmpty() );
      } else if( ToolsValidation.isName( name )  == false ) {
        errors.add( "name",  ErrorMessageTextConstant.nameLength()  );
      }
    }

    /// email
    if( email != null ) {
      if(ToolsValidation.isEmpty(  email ) ) {
        errors.add( "email",  ErrorMessageTextConstant.emailEmpty() );
      } else if( ToolsValidation.isEmail(  email  )  == false ) {
        errors.add( "email",  ErrorMessageTextConstant.emailInvalid() );
      }
    }

    /// phone
    if( phone != null ) {
      if(ToolsValidation.isEmpty(  phone ) ) {
        errors.add( "phone",  ErrorMessageTextConstant.phoneRequired() );
      } else if( ToolsValidation.isPhoneSaudi( phone  )  == false ) {
        errors.add( "phone",  ErrorMessageTextConstant.phoneInvalid()  );
      }
    }

    /// otp
    if( otp != null ) {
      if(ToolsValidation.isEmpty(  otp ) ) {
        errors.add( "otp",  ErrorMessageTextConstant.otpRequired() );
      } else if(  otp!.length < 4  ) {
        errors.add( "otp",  ErrorMessageTextConstant.otpLength()  );
      }
    }

    /// national id
    if( nationalIdSaudi != null ) {
      if( isNationalIdOptionalForever! ) {
        if(  nationalIdSaudi!.length < 10 && ToolsValidation.isValid( nationalIdSaudi) ) {
          errors.add( "national_id",  ErrorMessageTextConstant.nationalIdLength() );
        }
      } else {
        if(  nationalIdSaudi!.length < 10 ) {
          errors.add( "national_id",  ErrorMessageTextConstant.nationalIdLength() );
        }
      }
    }

    /// validate password
    if( password != null ) {
      if(ToolsValidation.isEmpty(  password ) ) {
        errors.add( "password",  ErrorMessageTextConstant.passwordRequired()  );
      } else if( ToolsValidation.isPasswordValid(  password  )  == false ) {
        errors.add( "password",  ErrorMessageTextConstant.passwordLength() );
      }
    }

    /// validate confirm password
    if( passwordConfirm != null ) {
      if(ToolsValidation.isEmpty(  passwordConfirm ) ) {
        errors.add( "password_confirm",  ErrorMessageTextConstant.passwordConfirmRequired() );
      } else if( ToolsValidation.isPasswordValid(  passwordConfirm  )  == false ) {
        errors.add( "password_confirm",  ErrorMessageTextConstant.passwordConfirmLength()  );
      }

      if(  passwordConfirm !=  password ) {
        errors.add( "password_confirm",  ErrorMessageTextConstant.passwordConfirmNotMatch() );
      }
    }
    if( errors.isFoundAnyError() ) {
      return errors.getError();
    } else {
      return null;
    }
  }


  //---------------------------------------------------------------- error single field

  static Map<String, dynamic>?  validateName( String? str ) {
    if(ToolsValidation.isEmpty( str ) ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "name", ErrorMessageTextConstant.nameEmpty());
    } else if( ToolsValidation.isName( str  )  == false ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "name",  ErrorMessageTextConstant.nameLength() );
    } else {
      return null ;
    }
  }


  static Map<String, dynamic>?  validateEmail( String? str ) {
    // Log.k(tag, "validateEmail - str: $str");
    if(ToolsValidation.isEmpty( str ) ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "email",  ErrorMessageTextConstant.emailEmpty() );
    } else if( ToolsValidation.isEmail( str  )  == false ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "email",  ErrorMessageTextConstant.emailInvalid() );
    } else {
      return null ;
    }
  }


  static Map<String, dynamic>?  validateOtp( String? str ) {
    // Log.k(tag, "validateOtp - str: $str");
    if(ToolsValidation.isEmpty( str ) ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "otp",  ErrorMessageTextConstant.otpRequired() );
    } else if(  str!.length < 4 ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "otp",  ErrorMessageTextConstant.otpLength() );
    } else {
      return null ;
    }
  }


  static Map<String, dynamic>?  validatePhoneAnyCountry(String? phone ) {
    if(ToolsValidation.isEmpty(  phone ) ) {
      // Log.i("validatePhone() - ToolsValidation.isEmpty YES");
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "phone", ErrorMessageTextConstant.phoneRequired()  );
    } else if( ToolsValidation.isPhoneMobileValidAndEnglishLetter(  phone  )  == false ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "phone",  ErrorMessageTextConstant.phoneInvalid() );
    } else {
      // Log.i("validatePhone() - good");
      return null;
    }
  }


  static Map<String, dynamic>?  validatePhoneSaudi(String? phone ) {
    Log.i("validatePhone() - phone: $phone");
    if(ToolsValidation.isEmpty(  phone ) ) {
      Log.i("validatePhone() - ToolsValidation.isEmpty YES");
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "phone",  ErrorMessageTextConstant.phoneRequired() );
    } else if( ToolsValidation.isPhoneSaudi( phone  )  == false ) {
      Log.i("validatePhone() - isPhoneSaudi NO");
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "phone",  ErrorMessageTextConstant.phoneInvalid()  );
    }
    Log.i("validatePhone() - good");
    return null;
  }


  static Map<String, dynamic>?  validatePassword(String? password) {
    if(ToolsValidation.isEmpty(  password ) ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "password",  ErrorMessageTextConstant.passwordRequired() );
    } else if( ToolsValidation.isPhoneMobileValidAndEnglishLetter(  password  )  == false ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "password",  ErrorMessageTextConstant.passwordLength() );
    } else {
      return null;
    }
  }


  static Map<String, dynamic>?  validatePasswordConfirmation(String? password, String? passwordConfirm) {
    if(ToolsValidation.isEmpty(  passwordConfirm ) ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "password_confirm",  ErrorMessageTextConstant.passwordConfirmRequired());
    } else if( ToolsValidation.isPasswordValid(  passwordConfirm  )  == false ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "password_confirm",  ErrorMessageTextConstant.passwordConfirmLength());
    } else if ( passwordConfirm !=  password  ){
      Log.i("validatePasswordConfirmation() - password: $password /confirm: $passwordConfirm");
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "password_confirm",   ErrorMessageTextConstant.passwordConfirmNotMatch() );
    } else {
      return null;
    }
  }

  static Map<String, dynamic>?  validateNationalIdSaudi(String? str) {
    if(  str!.length < 9 ) {
      return ErrorInputFieldGenerator.generateErrorArrayMessageShapeLaravelWithOneMessage( "national_id",  ErrorMessageTextConstant.nationalIdLength() );
    } else {
      return null ;
    }
  }


}
