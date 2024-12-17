class ErrorInputFieldParser {


  static String? getErrorMessage( {
    required    Map<String, dynamic>? array,
    required String? key
    }) {
    if (array != null) {
      return array!.keys.contains( key) ? array![key][0] : null;
    } else {
      return null;
    }
  }


}