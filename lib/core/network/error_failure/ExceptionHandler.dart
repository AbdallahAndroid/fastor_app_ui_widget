

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/error_failure/failure_exceptions.dart';

import 'failures.dart';

class ExceptionHandler {

  static   chooseThrowException<T>( int? statusCode,    Object? dataObj, )   {

    if( statusCode == null )  {
      Log.i("ExceptionHandler - chooseThrowException() - statusCode == null");
      throw DNSConnectionDomainFailedException("Check Internet Connection".tra() );
    }

    /// is null data
    bool isDataNull = dataObj == null;
    if( isDataNull ) {throw Exception(  );}

    /// is html or string
    bool isNotJson = dataObj is Map  == false;
    if( isNotJson ) {throw Exception(  );}

    /// cast
    Map<String, dynamic> data = Map();
    if( dataObj is Map<String, dynamic> ) {
      data = dataObj as Map<String, dynamic>;
    }

      switch ( statusCode) {
        case 401: throw ServerUnAuthenticationException( );
        case 422: {
          //Log.i("ExceptionHandler - chooseThrowException() 422 - data: $data ");
          if( isTypeArrayErrorListString(data ) ) {
            if( isFoundMessage( data )  ) {
              throw InputFieldInvalidException(  message:  data?["message"]  );
            }
            String msgArrayLines = parseErrorsMessageListString( data?["errors"] );
            throw InputFieldInvalidException(  message: msgArrayLines );
          } else if ( isTypeArrayErrorByKeysObjectJson(data)  ) {
            throw InputFieldInvalidException(  message: data?["message"], errors: data?["errors"]);
          }
          String? message = data?["message"];
          Log.i("ExceptionHandler - chooseThrowException() 422 - message: $message ");
          throw InputFieldInvalidException(  message:  message  );
        }

        case 429 : {
          throw ServerMessageException( "To Many Request" );
        }
        case 413 : {
          throw ServerMessageException( "Content is too large" );
        }
        default: {
          bool foundErrors = data.containsKey(  "errors"  );
          if( foundErrors  ) {
            throw InputFieldInvalidException(  message: data?["message"], errors: data?["errors"]);
          }

          bool foundMessage = data.containsKey( "message");
          if( foundMessage ) {
            throw ServerMessageException( data["message"] );
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