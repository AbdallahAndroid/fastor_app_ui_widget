
class ToolsNumber {

  //pages:  array = [51,4,6,8]; //resutl is 1
  static double getLargestNumber(List<double> array ){
    array.sort();
    var largest = array.last;
    return largest;
  }


  static double getSmallestNumber(List<double> array ){
    array.sort();
    var largest = array.first;
    return largest;
  }

  static String decimal2_xxDotYY(double? d ) {
    d ??= 0;
    return (d).toStringAsFixed(2);
  }

  /**
   * means plus 1 . in case "2.333" round to "3.0"
   */
  static int roundToPlus1(double row_counter ){
    //round
    double fraction =  row_counter -  row_counter.truncate();// '2.3555' >> "0.3555"
    if( fraction > 0.0 ) {
      row_counter = row_counter + 1 - fraction;
    }
    // Log.i("roundToPlus1() - row_counter: $row_counter ");
    return row_counter.toInt();
  }


}