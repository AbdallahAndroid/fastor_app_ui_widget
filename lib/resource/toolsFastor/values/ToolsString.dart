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

}