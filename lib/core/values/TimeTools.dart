
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/values/ToolsNumber.dart';
import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';
import 'package:intl/intl.dart';

class TimeTools {


  //--------------------------------------------------------------------- get current

  static String getCurrentDDMMYYYY(){
    var now = DateTime.now();
    var afterFormat = DateFormat('dd/MM/yyyy').format( now );
    return afterFormat.toString();
  }
  static String getCurrentYYYYMMDD(){
    var now = DateTime.now();
    var afterFormat = DateFormat('yyyy-MM-dd').format( now );
    return afterFormat.toString();
  }


  static String getCurrentTimeHHMMSS() {
    // Get the current time
    DateTime now = DateTime.now();

    // Format the time as "hh:mm:ss"
    String formattedTime = DateFormat('HH:mm:ss').format(now);

    return formattedTime;
  }


  /// https://stackoverflow.com/a/62233947/7186671
  /// 1654721784
  ///
  /// return micro
  /// 1654732024000
  static int getCurrentTimestamp() {
    // int numberWith1000 =  new DateTime.now().millisecondsSinceEpoch;
    var dateUtc = DateTime.now().toUtc();
    int numberWith1000 = dateUtc.millisecondsSinceEpoch;
    String num_str = numberWith1000.toString();
    int len = num_str.length;
    String cut1000 =  num_str.substring( 0 , len- 3 );
    return int.parse( cut1000 );
  }


  /**
      String startTime = '15:00:00';
      String endTime = '16:00:00';
   */
  static int calculateSecondsBetweenTwoTime_hhmmss(String startTime, String endTime) {
    // Parse the start and end time strings
    DateTime start = DateFormat('HH:mm:ss').parse(startTime);
    DateTime end = DateFormat('HH:mm:ss').parse(endTime);

    // Calculate the difference in seconds
    int differenceInSeconds = end.difference(start).inSeconds;
    // Log.i("calculateSecondsBetweenTwoTime_hhmmss() - start: $start /startTime: $startTime");
    // Log.i("calculateSecondsBetweenTwoTime_hhmmss() - end: $start /endTime: $endTime");
    // Log.i("calculateSecondsBetweenTwoTime_hhmmss() - differenceInSeconds: $differenceInSeconds");
    return differenceInSeconds;
  }

  //---------------------------------------------------------- REFORMATE


  static String convertyyyymmddhhmmsszzToyyyymmdd(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString); // Parse the original date
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate); // Format it to "yyyy-MM-dd"
    return formattedDate;
  }


  /// convert 'yyyy-MM-dd HH:mm:ss tz' to 'dd/MM'
  static String convertDateFormatFrom_YYYYMMDDHHMMSSTZ_to_DDMM(String inputDate) {
    DateTime parsedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(inputDate);
    String formattedDate = DateFormat('dd/MM').format(parsedDate);
    return formattedDate;
  }

  static String convertDateFormatFrom_YYYYMMDDHHMMSS_to_DDMM(String inputDate) {
    DateTime parsedDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(inputDate);
    String formattedDate = DateFormat('dd/MM').format(parsedDate);
    return formattedDate;
  }


  static String convertDateFormatFrom_YYYYMMDDHHMMSS_to_monthAndHour(String inputDate) {
    DateTime date = DateTime.parse(inputDate);
    String formattedDate = DateFormat('MM-d').format(date);
    String formattedTime = DateFormat('HH:mm').format(date);
    return '$formattedDate $formattedTime';
  }


  //-------------------------------------------------------------------- refromat hours mines

  /** - example:
      int totalSeconds = 125;
      String formattedTime = formatSecondsToMinutesAndSeconds(totalSeconds);
      print(formattedTime); // Output: 02:05
   */
  static String formatSecondsToMinutesAndSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }


  /***
   * figma; example   02 hr 30 min
   */
  static String formatSecondTo_hoursLeftAndMin(int seconds ) {
    int minutes = seconds ~/ 60;
    int hours =  minutes  ~/ 60;
    int remaningMinutes = minutes - ( hours * 60 );
    // Log.i("formatSecondTo_hoursLeftAndMin() - hours: $hours /minutes: $minutes /remaningMinutes: $remaningMinutes");
    // String minutesStr = minutes.toString().padLeft(2, '0');
    // Log.i("formatSecondTo_hoursLeftAndMin() - minutesStr: $minutesStr /minutes: $minutes");
    String hoursStr = hours.toString().padLeft(2, '0');
    bool isOneHourOrMore =  hours >= 1;
    if( isOneHourOrMore ) {
      return  "$hoursStr hr $remaningMinutes min";
    } else {
      return  "$remaningMinutes min";
    }
  }

  //---------------------------------------------------------------- message


  static String  generateTimeMessage(String createdAt){
    if(ToolsValidation.isEmpty( createdAt) )return "";
    if( TimeTools.isTodayFormate_dateToCheck_yyyy_mm_dd_hh_mm_ss_tz(  createdAt! ) ) {
      if( TimeTools.isWithinLast60MinutesDateToCheckYYYYMMDDHHMMSS( createdAt!) ) {
        return TimeTools.howManyMinutesBetweenNowAndThisDateToCheckYYYYMMDDHHMMSS(  createdAt!).toString() + "m";
      } else {
        return TimeTools.howManyHoursBetweenNowAndThisDateToCheckYYYYMMDDHHMMSS(  createdAt!).toString() + "h";
      }
    } else if( TimeTools.isYesterdayFormate_dateToCheck_yyyy_mm_dd_hh_mm_ss_tz(  createdAt! ) ) {
      return "Yesterday".tra();
    }
    /// case: very old date, old than yesterday
    return  TimeTools.convertDateFormatFrom_YYYYMMDDHHMMSSTZ_to_DDMM(  createdAt!);
  }

  //---------------------------------------------------------- compare time and diference


  static bool isTodayFormate_dateToCheck_yyyy_mm_dd_hh_mm_ss_tz(String  dateToCheck_yyyy_mm_dd_hh_mm_ss_tz) {
    // Log.i("isToday() - dateToCheck_yyyy_mm_dd_hh_mm_ss: $dateToCheck_yyyy_mm_dd_hh_mm_ss");
    DateTime today = DateTime.now();
    DateTime date = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(dateToCheck_yyyy_mm_dd_hh_mm_ss_tz);
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }


  static bool isTodayFormate_dateToCheck_yyyy_mm_dd_hh_mm_ss(String  dateToCheck_yyyy_mm_dd_hh_mm_ss  ) {
    // Log.i("isToday() - dateToCheck_yyyy_mm_dd_hh_mm_ss: $dateToCheck_yyyy_mm_dd_hh_mm_ss");
    DateTime today = DateTime.now();
    DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateToCheck_yyyy_mm_dd_hh_mm_ss);
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }


  static bool isYesterdayFormate_dateToCheck_yyyy_mm_dd_hh_mm_ss_tz(String  dateToCheck_yyyy_mm_dd_hh_mm_ss ) {
    DateTime parsedDate = DateTime.parse(dateToCheck_yyyy_mm_dd_hh_mm_ss);
    DateTime currentDate = DateTime.now();
    DateTime previousDay = currentDate.subtract(Duration(days: 1));
    return parsedDate.isAfter(previousDay) && parsedDate.isBefore(currentDate);
  }


  static bool isYesterdayFormate_dateToCheck_yyyy_mm_dd_hh_mm_ss(String  dateToCheck_yyyy_mm_dd_hh_mm_ss ) {
    DateTime parsedDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateToCheck_yyyy_mm_dd_hh_mm_ss);
    DateTime currentDate = DateTime.now();
    DateTime previousDay = currentDate.subtract(Duration(days: 1));
    // bool result =  parsedDate.isAfter(previousDay) && parsedDate.isBefore(currentDate);
    bool result = parsedDate.year == previousDay.year &&
        parsedDate.month == previousDay.month &&
        parsedDate.day == previousDay.day;
    // Log.i("isYesterdayFormate_dateToCheck_yyyy_mm_dd_hh_mm_ss() - dateToCheck_yyyy_mm_dd_hh_mm_ss: $dateToCheck_yyyy_mm_dd_hh_mm_ss /result: $result");
    return result;
  }


  static bool isWithinLast60MinutesDateToCheckYYYYMMDDHHMMSS(String dateToCheck_yyyy_mm_dd_hh_mm_ss) {
    DateTime parsedDate = DateTime.parse(dateToCheck_yyyy_mm_dd_hh_mm_ss);
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(parsedDate);
    // Log.i("isWithinLast60MinutesDateToCheckYYYYMMDDHHMMSS() - dateToCheck_yyyy_mm_dd_hh_mm_ss: $dateToCheck_yyyy_mm_dd_hh_mm_ss "
    //     "/difference.inMinutes: ${difference.inMinutes}");
    return difference.inMinutes < 60;
  }


  static int howManyMinutesBetweenNowAndThisDateToCheckYYYYMMDDHHMMSS(String dateToCheck_yyyy_mm_dd_hh_mm_ss) {
    DateTime parsedDate = DateTime.parse(dateToCheck_yyyy_mm_dd_hh_mm_ss);
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(parsedDate);
    return difference.inMinutes;
  }


  static int howManyHoursBetweenNowAndThisDateToCheckYYYYMMDDHHMMSS(String dateToCheck_yyyy_mm_dd_hh_mm_ss) {
    DateTime parsedDate = DateTime.parse(dateToCheck_yyyy_mm_dd_hh_mm_ss);
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(parsedDate);
    return difference.inHours;
  }


  static bool isSameDate(String dateString1, String dateString2) {
    DateTime date1 = DateTime.parse(dateString1);
    DateTime date2 = DateTime.parse(dateString2);
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  //---------------------------------------------------------------------- hours

  /**
      example:     String dateString = "2023-10-02 09:30:00";
   */
  static String convertFrom_yyyymmddhhmmss_to_hhmmpm(String dateString ) {
    DateTime date = DateTime.parse(dateString);
    String formattedTime = DateFormat('hh:mm a').format(date);
    // print(formattedTime);
    return formattedTime;
  }

  static String  removeSecondFromHHMMSSAndToHHMMPm(String  hh_mm_ss) {
    DateTime date = DateTime.parse("2000-01-01 " + hh_mm_ss); // Any date can be used here
    String formattedTime = DateFormat('hh:mm a').format(date);
    return formattedTime;
  }

  //--------------------------------------------------------------- seconds

  /// convert "2025-12-31T00:00:00.000000Z" to second
  static int convertDateToSecondBetweenNowAndThisDate(String isoDate ) {
    DateTime futureDate = DateTime.parse(isoDate) ;
    DateTime now = DateTime.now()   ;
    Duration difference = futureDate.difference(now);
    int secondsUntilNow = difference.inSeconds % 60;
    // Log.i("convertDateToSecondBetweenNowAndThisDate() - now: $now /futureDate: $futureDate /difference: $difference /second: $secondsUntilNow");
    return secondsUntilNow;
  }


  /// Convert seconds to days (1 day = 86400 seconds)
  static String convertSecondToDay(int secondsUntilNow ) {
    double daysUntilNow = secondsUntilNow / 86400;
    // Log.i("convertSecondToDay() -  secondsUntilNow: $secondsUntilNow /daysUntilNow: $daysUntilNow");
    return ToolsNumber.removeFractionFromDouble( daysUntilNow).toString();
  }


  /// used in counter how many time remaing of hour mines   days until reach today
  /// convert second to how many hours to end and mines all previous days
  static String convertSecondToHourRemaingForToday(int secondsUntilNow  ) {
    double daysUntilNow = secondsUntilNow / 86400;
    double fractionDay =   ToolsNumber.getFractionFromDouble(daysUntilNow);
    double hoursRemainig = fractionDay * 24;
    String removeFraction = ToolsNumber.removeFractionFromDouble( hoursRemainig).toString();
    return removeFraction;
  }


  /// used in counter how many time remaing of min mines hours and days until reach today
  static String convertSecondToMinRemaingForToday(int secondsUntilNow  ) {
    double daysUntilNow = secondsUntilNow / 86400;
    double fractionDay =   ToolsNumber.getFractionFromDouble(daysUntilNow);
    double hoursRemainig = fractionDay * 24;
    double fractionHour = ToolsNumber.getFractionFromDouble( hoursRemainig );
    double minRemainig = fractionHour * 60 ;
    String removeFraction = ToolsNumber.removeFractionFromDouble( minRemainig).toString();
    return removeFraction;
  }


  /// used in counter how many time remaing of second mines min, hours and days until reach today
  static String convertSecondToSecRemaingForToday(int secondsUntilNow  ) {
    double daysUntilNow = secondsUntilNow / 86400;
    double fractionDay =   ToolsNumber.getFractionFromDouble(daysUntilNow);
    double hoursRemainig = fractionDay * 24;
    double fractionHour = ToolsNumber.getFractionFromDouble( hoursRemainig );
    double minRemainig = fractionHour * 60 ;
    double fractionMin = ToolsNumber.getFractionFromDouble( minRemainig );
    double secRemainig = fractionMin * 60 ;
    String removeFraction = ToolsNumber.removeFractionFromDouble( secRemainig).toString();
    return removeFraction;
  }

  //----------------------------------------------------------------- day name

  /// convert "Sunday" to "su"
  static String convertDateNameToSmallLetter( String dayNameEnglish ) {
    var formatter = DateFormat.E();

    dayNameEnglish = dayNameEnglish.trim();
    dayNameEnglish = dayNameEnglish.toLowerCase();
    //  Log.i("convertDateNameToSmallLetter() - dayNameEnglish: $dayNameEnglish");

    final dateTime = DateTime.parse('2022-01-02'); // Any date can be used here
    for (int i = 1; i <= 7; i++) {
      final dayOfWeek = dateTime.subtract(Duration(days: dateTime.weekday - i));
      final formatted = formatter.format(dayOfWeek);
      //  Log.i("convertDateNameToSmallLetter() - dayOfWeek: $dayOfWeek /formatted: $formatted");
      if ( dayNameEnglish.startsWith( formatted.toLowerCase())  ) {
        var result =  formatter.add_jms().format(dayOfWeek).substring(0, 2);
        //   Log.i("convertDateNameToSmallLetter() - result: $result /dayNameEnglish: $dayNameEnglish");
        return result;
      }
    }
    return '';
  }

  /// example: check "Sunday" is today
  static bool isThisDayNameToday(String  dayNameEnglish) {

    dayNameEnglish = dayNameEnglish.trim();
    dayNameEnglish = dayNameEnglish.toLowerCase();

    DateTime now = DateTime.now();
    String dayNameToday = DateFormat('EEEE').format(now);
    dayNameToday = dayNameToday.toLowerCase();

    return dayNameToday == dayNameEnglish;
  }



}