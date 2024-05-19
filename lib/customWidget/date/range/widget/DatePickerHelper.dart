
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'DateRangePickerResult.dart';

/**
 *-------------- how to use
 *

    DateRangePickerResult? result = await DatePickerHelper.dateRange( context, widget.dateStart, widget.dateEnd );
    bool isUserSkipChooseDateRange = result == null;
    if(isUserSkipChooseDateRange ) {
    _removeOldSelectedDate();
    refreshCallbackListener( );
    } else {
    _setResultRangeDateToVariable(result);
    refreshCallbackListener();
    }

 */
class DatePickerHelper {

  static Future<DateRangePickerResult?> dateRange(BuildContext context, String? oldStartYYYYMMDD , String? oldEndYYYYMMDD ) async {

    // Log.i("dateRange() - oldStartYYYYMMDD: $oldStartYYYYMMDD");
    var oldRange = null;
    if( oldStartYYYYMMDD != null ) {
      String parseStartDDMMYYYY =  from_yyyymmdd_to_ddmmyyyy(oldStartYYYYMMDD);
      String parseEndDDMMYYYY =  from_yyyymmdd_to_ddmmyyyy(oldEndYYYYMMDD!);

      DateTime editStart = new DateFormat("dd/MM/yyyy").parse(parseStartDDMMYYYY!);
      DateTime editEnd = new DateFormat("dd/MM/yyyy").parse(parseEndDDMMYYYY!);
      oldRange = DateTimeRange( start: editStart , end: editEnd );
      // Log.i("dateRange() - format editStart: $editStart");
    }

    DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year-1 ),
        lastDate: DateTime(DateTime.now().year+1 ),
        initialDateRange: oldRange,
        initialEntryMode : DatePickerEntryMode.calendar,
    );
    if(picked == null ) return null;
    String start = DateFormat('yyyy/MM/dd').format(picked.start );
    String end = DateFormat('yyyy/MM/dd').format(picked.end ); // hh:mm:ss
    var result = DateRangePickerResult(start, end );
    // Log.i( "DialogPickDateTime - result: " + result.toString() );
    return result;
  }



  static String from_yyyymmdd_to_ddmmyyyy(String fromDate ) {
    var inputFormat = DateFormat('yyyy/MM/dd');
    var date1 = inputFormat.parse(fromDate ); //'18/08/2019'
    var outputFormat = DateFormat('dd/MM/yyyy');
    var date2 = outputFormat.format(date1); // 2019-08-18
    // print("from_mmddyyyy_to_yyyymmdd() - from: $fromDate /to: $date2");
    return date2;
  }
}