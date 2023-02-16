

class ToolsValidation {


  static bool isPhoneMobileValid(String? str) {
    if (isEmpty( str)) {
      return false;
    }
    int len = str!.length;
    if (len >= 8) {  //01012345678  or without countrycode "1012345678 saudi "512345678"
      return true;
    } else {
      return false;
    }
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


  static isEmail(String? s) {
    if( ToolsValidation.isEmpty(s )) return false;
    bool haveAt = s!.contains( "@");
    //Log.i("haveAt: " +  haveAt.toString() );
    if( haveAt  == false  ) return false;
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



}