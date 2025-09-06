

import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/network/error_failure/failures.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

/**
 * ----------- when to use this class ?
 *
 * in case not need to make layer exception, when skip exception throw in code backend
 *
 *
 *
 */
class ThrowerTypeFailure {

  static Failure   choose(    Response? response, )   {

    int? statusCode = response?.statusCode;
    if( response == null || statusCode  == null )  {
      Log.i("ThrowerTypeFailure - choose() - statusCode == null");
      throw NoInternetFailure( );
    }
 
    /// cast
    Map<String, dynamic> data = Map();
    if( response.data is Map<String, dynamic> ) {
      data = response.data as Map<String, dynamic>;
    }

      switch ( statusCode) {
        case 401: throw ServerUnAuthenticationFailure( );
        case 422: {
          //Log.i("ThrowerTypeFailure - choose() 422 - data: $data ");
          if( isTypeArrayErrorListString(data ) ) {
            if( isFoundMessage( data )  ) {
              throw InputFieldsInvalidFailure(  message:  data?["message"]  );
            }
            String msgArrayLines = parseErrorsMessageListString( data?["errors"] );
            throw InputFieldsInvalidFailure(  message: msgArrayLines );
          } else if ( isTypeArrayErrorByKeysObjectJson(data)  ) {
            throw InputFieldsInvalidFailure(  message: data?["message"], errors: data?["errors"]);
          }
          String? message = data?["message"];
          Log.i("ThrowerTypeFailure - choose() 422 - message: $message ");
          throw InputFieldsInvalidFailure(  message:  message  );
        }

        case 429 : {
          throw ServerMessageFailure( "To Many Request" );
        }
        case 413 : {
          throw ServerMessageFailure( "Content is too large" );
        }
        default: {
          bool foundErrors = data.containsKey(  "errors"  );
          if( foundErrors  ) {
            throw InputFieldsInvalidFailure(  message: data?["message"], errors: data?["errors"]);
          }

          bool foundMessage = data.containsKey( "message");
          if( foundMessage ) {
            throw ServerMessageFailure( data["message"] );
          }

          throw Exception(  );
        }
      }
  }


  static bool isFoundMessage( Map<String,dynamic>? data ) {
    if( data == null ) return false;
    if( data.containsKey( "message") == false ) return false;
    if( data[ "message"]  == null ) return false;
    return true;
  }


  /// example json :
  ///   errors: {
  ///    username: [The username field is required.]
  ///    phone: [The phone field is required.]
  ///  }
  static bool isTypeArrayErrorByKeysObjectJson(Map<String,dynamic>? data){
    return data?["errors"] is Map<String, dynamic>;
  }


  static bool isTypeArrayErrorListString(Map<String,dynamic>? data){
    if( data == null ) return false;
    if( data!.containsKey( "errors")) {
      return data?["errors"] is List<  dynamic>;
    } else {
      return false;
    }

  }


  /// example json :
  ///    {status: false, message: null, errors: [Quantity is not available for the product  RiyChicken - Baladi .]}
  static String parseErrorsMessageListString(List<dynamic> errorsArrayString ) {
    String msg = "";
    int len =  errorsArrayString.length;
    for( int i = 0 ; i <  errorsArrayString.length ; i++ ) {
      var element = errorsArrayString[ i ];
      bool  isLastItem = i == len - 1;
      //Log.i("parseErrorsMessageListString() loop i: $i /isLastItem: $isLastItem /element: $element");
      if(isLastItem ) {
        msg += element.toString();
      } else {
        msg += element.toString() + "\n";
      }
    }
    //Log.i("parseErrorsMessageListString() msg: $msg ");
    return msg;
  }




}