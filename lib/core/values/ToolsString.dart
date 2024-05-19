class ToolsString {

  /**
   example:
      String mainString = "4.5";
      var r = RegExp(r'[.]').hasMatch(mainString);
      print("abdo - test " + r.toString() );
   */
  /// check contain regix
  static bool isContainSingleCharacter({ required String mainString, required  String charSingle} )  {
    if(charSingle.length > 1 ) {
      return false;
    }
    var r = RegExp(r"[" + charSingle + "]").hasMatch(mainString);
    // print("abdo - test " + r.toString() );
    return r;
  }


  static String  removeLastChar(String str ){
    //print( "_removeLastChar() - check: $str ");
    if (str != null && str.length > 0) {
      str = str.substring(0, str.length - 1);
    }
    //print( "_removeLastChar() - result: $str ");
    return str;
  }


}