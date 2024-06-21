
class ToolsPrice {


  /**
   * - convert "12.3412" to "12.34"
   * - convert "12.0000" to "12"
   */
  static String price(  double? d ) {

    //rounded xx.yy
    d ??= 0.0;
    double roundedTwoFraction = double.parse((d).toStringAsFixed(2));

    //remove ".00" if found
    String s =  roundedTwoFraction.toString();
    if( s.endsWith( ".00") ) {
      s = s.replaceAll( ".00", "" );
    }

    //endfix
    String rial = "\$";
    return s  + " "  + rial ;
  }

  //------------------------------------------------------------------------thousandAndMillion

  /// convert 2000000 to 2 Mill.
  /// convert 2500000 to 2.5 Mill.
  static String thousandAndMillion(int price) {
    String thousandWord = "Thous."; //"thousand".tra();
    String millionWord = "Mill." ; // "million".tra();

    if (price >= 1000000) {
      // double million = price / 1000000;
      // return '${million.toStringAsFixed(million == million.floor() ? 0 : 1)} ' + millionWord;
      // return  (price / 1e6).toStringAsFixed(2)  + " "+ millionWord;
      return _formatWithUnit(price.toDouble(), 1e6, millionWord);
    } else if (price >= 1000) {
      // double thousand = price / 1000;
      // return '${thousand.toStringAsFixed(thousand == thousand.floor() ? 0 : 1)} ' + thousandWord;
      // return (price / 1e3).toStringAsFixed(2) + " " + thousandWord;
      return _formatWithUnit(price.toDouble(), 1e3, thousandWord);
    } else if ( price == 0 ) {
      return "0 " + thousandWord;
    } else  {
      return '$price';
    }
  }


  static String _formatWithUnit(double number, double divisor, String unit) {
    double value = number / divisor;
    String formattedValue = value.toStringAsFixed(2);

    // Strip unnecessary trailing zeros and decimal point
    formattedValue = formattedValue.replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');

    return formattedValue + ' ' + unit;
  }



}
