

class ToolsValidation {


  /***
    this check it's like "0101234568" to be return true,
      if it hase any abc it will return false
   */
  static bool checkTextIsPhoneNumberCharsOnlyWithoutAbc(String text) {
    // Null or empty string is not a number
    if (text == null || text.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = num.tryParse(text);
    if (number == null) {
      return false;
    }
    return true;
  }


  /// check for arabic number :   ١٢٣٤٥٦٧٨٩٠   now return false
  static bool isPhoneMobileValid(String? str) {
    if (isEmpty( str)) {
      return false;
    }
    int len = str!.length;
    if (len  < 8) {  //01012345678  or without countrycode "1012345678 saudi "512345678"
      return false;
    }
    return true;
  }


  static bool isPhoneMobileValidAndEnglishLetter(String? str) {
    if (isEmpty( str)) {
      return false;
    }
    int len = str!.length;
    if (len  < 8) {  //01012345678  or without countrycode "1012345678 saudi "512345678"
      return false;
    }
    if( ToolsValidation.isStringContainArabicNumber(str!) ) {
      return false;
    }
    return true;
  }

  static bool isPasswordValid(String? str)
  {
    if (isEmpty(str)) {
      return false;
    }
    int len = str!.length;
    if (len >= 8) {
      return true;
    } else {
      return false;
    }
  }

  static bool isValid(String? str)
  {
    return ! isEmpty( str ) ;
  }


  static bool isEmpty(String? str)
  {
    if (str == null) {
      return true;
    }
    if (str == "") {
      return true;
    }
    if (str == "null") {
      return true;
    }
    if (str == "nil") {
      return true;
    }
    if (str.length == 0) {
      return true;
    }
    return false;
  }

  static bool isMoreThan2(String? str)  {
    if (isEmpty(str)) {
      return false;
    }
    int len = str!.length;
    if (len >= 2) {
      return true;
    } else {
      return false;
    }
  }

  static bool isNameFull(String? str)
  {
    if (isEmpty(str)) {
      return false;
    }
    int len = str!.length;
    if (len >= 5) {
      return true;
    } else {
      return false;
    }
  }


  static bool isName(String? str)
  {
    if (isEmpty(str)) {
      return false;
    }
    int len = str!.length;
    if (len >= 2) {
      return true;
    } else {
      return false;
    }
  }


  /// check have "@" and "." and anyThingAfter last dot
  static isEmail(String? s) {
    if( s == null ) return false;
    if( s == "" ) return false;
    bool haveAt = s!.contains( "@");
    //Log.i("haveAt: " +  haveAt.toString() );
    if( haveAt  == false  ) return false;
    bool haveDot = s!.contains( ".");
    if( haveDot  == false  ) return false;

    int indexOfLastDot = s!.lastIndexOf( ".");
    bool thereIsDotAnyThing = s!.length > (indexOfLastDot + 1);
    print("index?OfLastDot: " +  indexOfLastDot.toString()  + " /size: " + s.length.toString());
    if( thereIsDotAnyThing == false  ) return false;
    return true;
  }


  static String egyptionCodeCountry_returnByPlus(String? str)
  {
    if ( isEmpty( str ) ) {
       return  "";
    }

    String result = "";
    bool isStartWith_002 = str!.startsWith("002");
    if (isStartWith_002) {
    //java to dart
      // String afterRemove002 = str.replace("002", "");
      String afterRemove002 = str.replaceFirst(RegExp(r'002'), '');
      str = afterRemove002;
    }
    String egyptionKeyPhone_plus2 = "+2";
    bool isContainEgytpionKey = str.startsWith(egyptionKeyPhone_plus2);
    if (isContainEgytpionKey) {
      return str;
    }
    result = (egyptionKeyPhone_plus2 + str);
    return result;
  }



  static bool isValidList(List<String>? listStr)
  {
    return !isEmptyList(listStr);
  }

  static bool isEmptyList(List<String>? myList)
  {
    if (myList == null) {
      return true;
    }
    if (myList.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool isEmptyListInteger(List<int>? myList)
  {
    if (myList == null) {
      return true;
    }
    if (myList.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool isValidListInteger(List<int>? list)
  {

    return !isEmptyListInteger(list);
  }



  static bool isZero(String? v)
  {
    if (!isValid(v)) {
      return false;
    }
    if (v == "0") {
      return false;
    }
    return true;
  }

  static bool isNotZeroInt(int? v ) {
    return !isZeroInt(v);
  }


  static bool isZeroInt(int? v) {
    if ( v == null ) return true;
    if ( v == 0 ) return true;
    return false;
  }

  static bool isValidInteger(int? n) {
    if( n == null ) return false;
    if( n == 0 ) return false;
    return true;
  }

  //---------------------------------------------------------------- arabic


  ///    isStringContainArabicNumber( "٠١٢٣٤٥٦٧٨٩")  >> return true
  ///    isStringContainArabicNumber( "010123456789"); >> return false
  static isStringContainArabicNumber(String check ) {
    String fullNumberArabic = "٠١٢٣٤٥٦٧٨٩";
    for( int i = 0 ; i < check.length ; i++ ) {
      String c = check[i];
      bool containArabic = fullNumberArabic.contains( c );
      // print("isStringContainArabicNumber() - c: $c /contain: $containArabic");
      if( containArabic ) {
        return true;
      }
    }
    return false;
  }

}