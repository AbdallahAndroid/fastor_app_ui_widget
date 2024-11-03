
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../customWidget/date/range/widget/DateRangePickerResult.dart';

import 'package:fastor_app_ui_widget/core/date/DatePickerCallBack.dart';
import 'package:flutter/material.dart' as material;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart' as syncfusion;
import '../../customWidget/date/range/widget/DateRangePickerResult.dart';

/**
 *-------------- how to use
 *

    DateRangePickerResult? result = await DatePickerHelper.dateRangeMaterialDesign( context, widget.dateStart, widget.dateEnd );
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


  static  dateRangePluginSyncfusion(  {
    required material.BuildContext context,
    String? oldStartYYYYMMDD ,
    String? oldEndYYYYMMDD,
    required DatePickerCallBack callback,
  } ) async {

    // Log.i("dateRange() - oldStartYYYYMMDD: $oldStartYYYYMMDD");
    syncfusion.PickerDateRange? oldRange = null;
    if( oldStartYYYYMMDD != null ) {
      String parseStartDDMMYYYY =  from_yyyymmdd_to_ddmmyyyy(oldStartYYYYMMDD);
      String parseEndDDMMYYYY =  from_yyyymmdd_to_ddmmyyyy(oldEndYYYYMMDD!);

      DateTime editStart = new DateFormat("dd/MM/yyyy").parse(parseStartDDMMYYYY!);
      DateTime editEnd = new DateFormat("dd/MM/yyyy").parse(parseEndDDMMYYYY!);
      oldRange = syncfusion.PickerDateRange(   editStart ,   editEnd );
      // Log.i("dateRange() - format editStart: $editStart");
    }

    material.showDialog(
      context: context,
      builder: (material.BuildContext context) {
        return material.AlertDialog(
          content: material.Container(
            height: 400,
            width: 300,
            child: syncfusion.SfDateRangePicker(
              view: syncfusion.DateRangePickerView.month, // Show only one month at a time
              selectionMode: syncfusion.DateRangePickerSelectionMode.range,
              minDate: DateTime(DateTime.now().year - 1),
              maxDate:  DateTime.now(),
              initialSelectedRange: oldRange,
              onSelectionChanged: (syncfusion.DateRangePickerSelectionChangedArgs args) {
                // Get the selected range
                if (args.value is syncfusion.PickerDateRange) {
                  DateTime startDate = args.value.startDate;
                  DateTime? endDate = args.value.endDate ;
                  Log.i("dateRangePluginSyncfusion() - select range: $startDate to $endDate");

                  if( endDate == null ) return;

                  String start = DateFormat('yyyy/MM/dd').format(startDate );
                  String end = DateFormat('yyyy/MM/dd').format(endDate ); // hh:mm:ss
                  var result = DateRangePickerResult(start, end );

                  material.Navigator.pop(context);
                  callback( result );


                }
              },
            ),
          ),
        );
      },
    );

  }


  static Future<DateRangePickerResult?> dateRange(material.BuildContext context, String? oldStartYYYYMMDD , String? oldEndYYYYMMDD ) async {

    // Log.i("dateRange() - oldStartYYYYMMDD: $oldStartYYYYMMDD");
    var oldRange = null;
    if( oldStartYYYYMMDD != null ) {
      String parseStartDDMMYYYY =  from_yyyymmdd_to_ddmmyyyy(oldStartYYYYMMDD);
      String parseEndDDMMYYYY =  from_yyyymmdd_to_ddmmyyyy(oldEndYYYYMMDD!);

      DateTime editStart = new DateFormat("dd/MM/yyyy").parse(parseStartDDMMYYYY!);
      DateTime editEnd = new DateFormat("dd/MM/yyyy").parse(parseEndDDMMYYYY!);
      oldRange = material.DateTimeRange( start: editStart , end: editEnd );
      // Log.i("dateRange() - format editStart: $editStart");
    }

    material.DateTimeRange? picked = await material.showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year-1 ),
      lastDate: DateTime.now(   ),
      initialDateRange: oldRange,
      initialEntryMode : material.DatePickerEntryMode.calendarOnly,
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