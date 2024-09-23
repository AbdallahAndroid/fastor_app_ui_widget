

import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';

class ToolsPhone {

  //---------------------------------------------------------------------- full phone

  /**
      I/flutter ( 3679): abdo : 04:32:25:470 : getFullPhone() - before edit: +20010 6340 002
      I/flutter ( 3679): abdo : 04:32:25:484 : getFullPhone() - after edit: +201063400002
   */
  static String fixEgyptAndSaudiNumber(String countryCode, String phone ) {
   // Log.i( "getFullPhone() - before edit - phone: " + phone  );

    //check null or empty countryCode
    if( ToolsValidation.isEmpty( phone ) ) return "";
    if( ToolsValidation.isEmpty( countryCode )) return phone;

    //trim space
   countryCode = countryCode.trim();
   phone = phone.trim();

    // remove any space :
    //     example 010 1234 5678 to be 01012345678
    countryCode = countryCode.replaceAll( " ",  "");
    phone = phone.replaceAll( " ",  "");

    //case : Egypt most of egyption enter phone "+20 01012345678" this is wrong way
    //       the right way to enter "+20 1012345678"
    bool isEgypt = countryCode == "+20";
    if(  isEgypt ) {
      if( phone.startsWith( "01") ) {
        phone = phone.replaceFirst( "01",  "1");
       // phoneController.text = phone;
      }
    }
   //case : Saudi most of Saudi enter phone "+966 05*******" this is wrong way
   //       the right way to enter "+966 5********"
   bool isSaudi = countryCode == "+966";
   if(  isSaudi ) {
     if( phone.startsWith( "0") ) {
       phone = phone.replaceFirst( "0",  "");
       // phoneController.text = phone;
     }
   }

    //default
    var result = countryCode + phone;
    // Log.i( "getFullPhone() - after edit: " + result  );
    return result;
  }

  
  static String fixEgyptAndSaudiZeroNumberReturnJustPhone(String countryCode, String phone ) {
    //check null or empty countryCode
    if( ToolsValidation.isEmpty( phone ) ) return "";
    if( ToolsValidation.isEmpty( countryCode )) return phone;

    String fullPhone = fixEgyptAndSaudiNumber( countryCode, phone );
    String phoneOnly = fullPhone.substring( countryCode.length );
    Log.i("fixEgyptAndSaudiZeroNumberReturnJustPhone() - fullPhone: $fullPhone /phoneOnly: $phoneOnly");
    return phoneOnly;
  }

}