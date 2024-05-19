import '../../values/ToolsString.dart';

/// api parse status, or boolean, or double as string format
class ApiParserFastor {

//------------------------------------------------------------------ boolean read

      ///  - example success:
      ///   {
      ///  "status": "success",
      /// "code": 1,
      ///
      ///  - example faild:
      ///  {
      ///  "status": "error",
      ///  "code": 0,
      ///   "message": "Unauthorized"
      ///  }
      ///
  static bool isSuccess(int? n) {
    if (n == null) return false;
    if (n == 0) return false;
    if (n == 1) return true;
    return false;
  }

  /// is True
  static bool isTrue(int? n) {
    return isSuccess(n);
  }

  /// is isFalse
  static bool isFalse(int? n) {
    return !isSuccess(n);
  }

  /// is isFailed
  static bool isFailed(int? n) {
    return !isSuccess(n);
  }

  /// parseBoolean, parameter int
  static bool parseBoolean_int(int? n) {
    return isSuccess(n);
  }

   /// "block": "0",  >> means false
  static bool parseBoolean(String? n) {
    if (n == null) return false;

    //case true
    if (n == "1") return true;

    //default
    return false;
  }

  //------------------------------------------------------------------ boolean change

   ///used to change status from "favorite" to "unfavorite" and vise versa
  static int verseBooleanZeroToOneAndViseVersa(int? i) {
    if (i == null) return 0;
    if (i == 0) return 1; // change status
    else
      return 0;
  }

  /// convert Boolean To ZeroAndOne
  static int convertBooleanToZeroAndOne(bool? b ) {
    if( b == null ) return 0;
    if( b ) {
      return 1;
    } else {
      return 0;
    }
  }

  //-------------------------------------------------------------------- paginate


  ///1- example totalBar record is 100, while pagiantor is 10
  /// current page is 9
  /// "to" is 10
  ///  >> result false
  ///
  ///2- example totalBar record is 100, while pagiantor is 10
  /// current page is 10
  /// "to" is 10
  ///  >> result true "there is no next pages"
  ///
  ///
  ///
  ///3- example totalBar record is 0 zero, while pagiantor is 10
  /// current page is 1
  /// "to" is 0
   ///  >> result true "there is no next pages"
   ///
  static bool isPaginateLaravelEnd(int? currentPage, int? last_page) {
    if (currentPage == null) return false;
    if (last_page == null) return false;
    /**
     * why write <= not write == ?
     * in case zero record the "to" is zero while current page is "1"
     */
    bool result = last_page <= currentPage;
    // Log.i( "isPaginateLaravelEnd() - currentPage: " + currentPage.toString() +
    //  " /last_page: " + last_page.toString() + " /result: " + result.toString()  );
    return result;
  }

  //--------------------------------------------------------------------- parse double

  /// fix when api return value someTime in "Int" and sometimes in "Double"
  ///  like: { "data": 15 }  or some times return { "data": 13.5 }
  ///  remove command "," if found in at big numbers come from backend
  static double parseDoubleOrInt(dynamic data) {
    if( data  ==  null  ) return 0.0;
    if( data.toString() ==  "null" ) return 0.0;

    String check = data.toString();
    double result = 0.0;

    //fix missed "." dot
    bool isNeedToAddDotCharecter = ToolsString.isContainSingleCharacter(
        mainString: check, charSingle: ".") == false;
    if (isNeedToAddDotCharecter) {
      check = check + ".0";
    }
    String addedDots = check.toString();

    //fix remove all comma ","
    String removedComma = addedDots.replaceAll(RegExp(r','), '');

    result = double.parse(removedComma);
    return result;
  }

  //--------------------------------------------------------------------- parse int

  /// parse IntDynamic
  static int parseIntDynamic(dynamic data) {
    if( data  ==  null  ) return 0 ;
    if( data.toString() ==  "null" ) return 0 ;

    String integerString = data.toString();
    // print("parseIntDynamic() - data: $data ");
    //fix missed "." dot
    bool isDoubleValue = ToolsString.isContainSingleCharacter(
        mainString: integerString, charSingle: ".");
    if (isDoubleValue) {
      try {
        String check = data.toString();
        int indexOfDot = check.indexOf(".");
        // print("parseIntDynamic() - indexOfDot: $indexOfDot");
        String beforeDot = check.substring(0, indexOfDot);
        integerString = beforeDot;
        // print("parseIntDynamic() - data: $data /beforeDot: $beforeDot");
      } catch (e) {
        // print("parseIntDynamic() - data: $data /excep: $e");
        integerString = "0";
      }
    }
    try {
      int result = int.parse(integerString);
      // print("parseIntDynamic() - result: $result");
      return result;
    } catch (e) {
      // print("parseIntDynamic() - invalid format");
      return 0;
    }
  }



}