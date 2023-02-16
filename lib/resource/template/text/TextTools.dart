
class TextTools {


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

  //
  //
  // static String price(  int? valueToCheck ) {
  //
  //   if ( ToolsValue.isValidInteger(valueToCheck)) {
  //     String rial = "\$";
  //     String ifHaveValue_addThis = "" + valueToCheck.toString() + " "  + rial ;
  //     return ifHaveValue_addThis;
  //   } else {
  //     return "";
  //   }
  // }

  //
  // static String priceString(  String? valueToCheck ) {
  //
  //   valueToCheck ??= "0";
  //
  //   //remove after
  //
  //   if ( ToolsValue.isValid(valueToCheck)) {
  //     String rial = "\$";
  //     String ifHaveValue_addThis = "" + valueToCheck + " "  + rial ;
  //     return ifHaveValue_addThis;
  //   } else {
  //     return "";
  //   }
  // }

}

/**       ----------- need to convert
 *
 *



    public static void textview_checkHaveValue_percentage(TextView tv, String valueToCheck, Activity mActivity) {
    if (tv == null) return;
    if (checkHaveValue(valueToCheck)) {
    String percentage = "%";
    String ifHaveValue_addThis = percentage + valueToCheck;
    ifHaveValue_addThis = filterStrings(ifHaveValue_addThis);
    tv.setText(ifHaveValue_addThis);
    } else {
    tv.setText("");
    }
    }


    public static void textview_checkHaveValue_rateValue(TextView tv, float valueToCheck) {
    if (tv == null) return;
    if ( valueToCheck == 0) {
    tv.setText("0.0");
    }
    //set max lenght to avoid 1.5555 to be 1.5
    /* set in xml
    android:maxLength="3"
    */
    // valueToCheck = filterStrings(valueToCheck);
    //set value
    tv.setText("" + valueToCheck);
    }

    public static void textview_checkvalue_phone(TextView tv, String phone) {
    //check null
    if (tv == null) return;
    //check have value
    if (!isValid(phone)) {
    tv.setText("");
    return;
    }
    //check have +2 in first index
    if (phone.startsWith("+")) {
    String removeFirstPlus = phone.substring(1);
    phone = "00" + removeFirstPlus;
    }
    //set phone
    tv.setText(phone);
    }

    public static void textview_checkvalue_dateTimeStamp(TextView tv, long date_timeStamp) {
    //check null
    if (tv == null) return;
    //check have value
    if (date_timeStamp == 0) {
    tv.setText("");
    return;
    }
    //convert timeStamp >> date yyymmdd \n  HH:MM
    String yyyymmdd = ToolsTime.convertTimestamp_to_date__yyyyMMdd(date_timeStamp);
    String hhmm = ToolsTime.convertTimestamp_to_date__hhmm(date_timeStamp);
    String converDateToTimeStamp = yyyymmdd + "\n" + hhmm;
    if (ToolsGeneral.isEmpty(converDateToTimeStamp)) {
    tv.setText("");
    return;
    }
    //now good health set date
    tv.setText(converDateToTimeStamp);
    }
*/