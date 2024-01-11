import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';

class ValidateResponse {

  //--------------------------------------------------------------- status code

  /**
   * status between 200 - 210
   */
  static bool isStatusFrom200To210(Response response ) {
    if( response.statusCode == null ) return false;
    if( response.statusCode! >  210 ) return false;
    if( response.statusCode! <  200 ) return false;
    return true;
  }

  /**
   * 403 Forbidden status code.
   *  401 Unauthorized.
   */
  static bool isResponseStatusCodeInvalidToken(Response response ) {
    if( response.statusCode == null ) return false;
    if( response.statusCode ==  401 ) return true;
    if( response.statusCode ==  403 ) return true;
    return false;
  }


  static bool isStatusCredentialWrong(Response response ) {
    if( response.statusCode == null ) return false;
    return response.statusCode! ==  403;
  }

  static bool isValidJson(Response response ) {
    if( response.data != null ) return false;
    bool isValidJson = response.data is Map;
    if( isValidJson == false ) return false;
    return true;
  }

  static bool isStatusBadRequest(Response response ) {
    if( response.statusCode == null ) return false;
    return response.statusCode! ==  400;
  }

  //--------------------------------------------------------------- convert boolean

  /**
      - example success:
      {
      "status": "success",
      "code": 1,

      - example faild:
      {
      "status": "error",
      "code": 0,
      "message": "Unauthorized"
      }

   */
  @Deprecated("see class (ApiParserFastor)")
  static bool isSuccess(int? n ) {
    if ( n == null ) return false;
    if ( n == 0 ) return false;
    if ( n == 1 ) return true;
    return false;
  }

  @Deprecated("see class (ApiParserFastor)")
  static bool isTrue(int? n ) {
    return isSuccess( n );
  }

  @Deprecated("see class (ApiParserFastor)")
  static bool isFalse(int? n ) {
    return ! isSuccess( n );
  }

  @Deprecated("see class (ApiParserFastor)")
  static bool isFailed(int? n ) {
    return !isSuccess(n);
  }

  @Deprecated("see class (ApiParserFastor)")
  static bool parseBoolean_int(int? n) {
    return isSuccess(n);
  }

  /**
      "block": "0",  >> means false
   */
  @Deprecated("see class (ApiParserFastor)")
  static bool parseBoolean(String? n) {
    if( n == null )return false;

    //case true
    if( n == "1" )return true;

    //default
    return false;
  }

  /**
   * used to change status from "favorite" to "unfavorite" and vise versa
   */
  @Deprecated("see class (ApiParserFastor)")
  static int changeStatus(int? i) {
    if( i == null ) return 0;
    if( i == 0 ) return 1;// change status
    else return 0;
  }

  /**
   *1- example totalBar record is 100, while pagiantor is 10
   * current page is 9
   * "to" is 10
   *  >> result false
   *
   *2- example totalBar record is 100, while pagiantor is 10
   * current page is 10
   * "to" is 10
   *  >> result true "there is no next pages"


   *
   *3- example totalBar record is 0 zero, while pagiantor is 10
   * current page is 1
   * "to" is 0
   *  >> result true "there is no next pages"
   */
  @Deprecated("see class (ApiParserFastor)")
  static bool isPaginateLaravelEnd(int? currentPage, int? last_page) {
    if( currentPage == null ) return false;
    if( last_page == null ) return false;
    /**
     * why write <= not write == ?
     * in case zero record the "to" is zero while current page is "1"
     */
    bool result =  last_page <= currentPage;
   // Log.i( "isPaginateLaravelEnd() - currentPage: " + currentPage.toString() +
   //  " /last_page: " + last_page.toString() + " /result: " + result.toString()  );
    return result;
  }


  /**
   * status between 200 - 210
   */
  @Deprecated("see class (ApiParserFastor)")
  static bool isSuccessStatusCode(Response response ) {
    if( response.statusCode == null ) return false;
    if( response.statusCode! >  210 ) return false;
    if( response.statusCode! <  200 ) return false;
    return true;
  }

}