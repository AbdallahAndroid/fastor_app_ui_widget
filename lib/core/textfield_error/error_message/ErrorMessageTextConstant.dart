

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';

class ErrorMessageTextConstant {

  static String nameEmpty() => "name required".tra();
  static String nameLength() => "name at least 2 letter".tra();

  static String emailEmpty() =>  "email required".tra();
  static String emailInvalid() => "invalid email".tra();

  static String phoneRequired () => "phone required".tra();
  static String phoneInvalid () => "invalid phone number".tra();

  static String passwordRequired () => "enter password".tra();
  static String passwordLength () => "enter password at least 8 char".tra();

  static String passwordConfirmRequired () => "password required".tra();
  static String passwordConfirmLength () =>  "enter password at least 8 char".tra();
  static String passwordConfirmNotMatch () => "password confirm not match".tra();

  static String otpRequired() => "OTP required".tra();
  static String otpLength() => "OTP must be 4 digits".tra();

  static String nationalIdLength () => "national ID is 10 number".tra();

}