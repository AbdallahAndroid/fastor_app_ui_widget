

import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/network/error_failure/failures.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

/**
 * ----------- when to use this class ?
 *
 * in case not need to make layer exception, when skip exception throw in code backend

 */
/// example
///   static Future<Either<Failure, SendOtpResponse> > sendOtp(SendOTPRequest request ) async {
//     String url = EndPoint.authSendOtp;
//     var responseDio = await NetworkManagerDio().post(url,
//         headers: NetworkConfig.getHeaders(),
//         body: request.toJson(),
//         isEnableLogDioPretty: true );
//     if (ValidateResponse.isStatusFrom200To210Code(responseDio.statusCode)) {
//       var response = SendOtpResponse.fromJson(responseDio.data);
//       return right(response);
//     } else {
//       return left( ThrowerTypeFailure.choose( responseDio )) ;
//     }
//   }
class ThrowerTypeFailure {

  static Failure   choose(    Response? response, )   {
    Log.i("ThrowerTypeFailure - choose() - response: $response");

    int? statusCode = response?.statusCode;
    if( response == null || statusCode  == null )  {
      Log.i("ThrowerTypeFailure - choose() - statusCode == null");
      return NoInternetFailure( );
    }

    /// cast
    Map<String, dynamic> data = Map();
    if( response.data is Map<String, dynamic> ) {
      data = response.data as Map<String, dynamic>;
    }

    switch ( statusCode) {
      case 401: return ServerUnAuthenticationFailure( );
      case 422: {
        //Log.i("ThrowerTypeFailure - choose() 422 - data: $data ");
        if( _isTypeArrayErrorListString(data ) ) {
          if( _isFoundMessage( data )  ) {
            return InputFieldsInvalidFailure(  message:  data?["message"]  );
          }
          String msgArrayLines = _parseErrorsMessageListString( data?["errors"] );
          return InputFieldsInvalidFailure(  message: msgArrayLines );
        } else if ( _isTypeArrayErrorByKeysObjectJson(data)  ) {
          return InputFieldsInvalidFailure(  message: data?["message"], errors: data?["errors"]);
        }
        String? message = data?["message"];
        Log.i("ThrowerTypeFailure - choose() 422 - message: $message ");
        return InputFieldsInvalidFailure(  message:  message  );
      }

      case 429 : {
        return ServerMessageFailure( "To Many Request" );
      }
      case 413 : {
        return ServerMessageFailure( "Content is too large" );
      }
      default: {
        bool foundErrors = data.containsKey(  "errors"  );
        if( foundErrors  ) {
          return InputFieldsInvalidFailure(  message: data?["message"], errors: data?["errors"]);
        }

        bool foundMessage = data.containsKey( "message");
        if( foundMessage ) {
          return ServerMessageFailure( data["message"] );
        }

        return ServerMessageFailure( "Failed"  );
      }
    }
  }


  static bool _isFoundMessage( Map<String,dynamic>? data ) {
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
  static bool _isTypeArrayErrorByKeysObjectJson(Map<String,dynamic>? data){
    return data?["errors"] is Map<String, dynamic>;
  }


  static bool _isTypeArrayErrorListString(Map<String,dynamic>? data){
    if( data == null ) return false;
    if( data!.containsKey( "errors")) {
      return data?["errors"] is List<  dynamic>;
    } else {
      return false;
    }

  }


  /// example json :
  ///    {status: false, message: null, errors: [Quantity is not available for the product  RiyChicken - Baladi .]}
  static String _parseErrorsMessageListString(List<dynamic> errorsArrayString ) {
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