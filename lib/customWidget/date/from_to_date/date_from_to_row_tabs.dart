import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/date/from_to_date/widget/date_hint_box_tab.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



typedef DateFromToPickerListener = Function(bool  isValidToDateDateGreaterThanFromDate, String? selectedFrom, String? selectedTo);

class DateFromToRowTabs extends StatefulWidget {


  String? previousDateSelectedFrom;
  String? previousDateSelectedTo;
  DateFromToPickerListener listener;


  DateFromToRowTabs( {
    required this.listener,
    this.previousDateSelectedFrom,
    this.previousDateSelectedTo
  });

  @override
  State<StatefulWidget> createState() => DateFromToRowTabsState();


}

class DateFromToRowTabsState extends State<DateFromToRowTabs> {


  String? selectedDateFrom, selectedDateTo;

  bool  isValidToDateDateGreaterThanFromDate = true  ;

  @override
  void initState() {
    selectedDateFrom = widget.previousDateSelectedFrom;
    selectedDateTo = widget.previousDateSelectedTo;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateHintBoxTab(
                hint:  "From".tr(),
                previousSelected: selectedDateFrom,
                width: 165.wr,
                onTap:  () => _showFromDatePicker(context),
              ),

              DateHintBoxTab(
                hint:  "To".tr(),
                previousSelected: selectedDateTo,
                width: 165.wr,
                onTap:  () => _showToDatePicker(context),
              )

            ],
          ),

          if( isValidToDateDateGreaterThanFromDate == false ) errorMessage()

        ],
      ),
    ) ;
  }

  errorMessage() {
    return  Container(
      width: DeviceTools.getWidth(context),
      margin: EdgeInsets.only(top: 4.hr ),
      alignment: LangApp.getAlignmentGeometryStart(),
      child: TextApp( "Date 'From' Less Than Date 'To'".tra() ,
        color: AppColor.red,
        fontSize: 14.sp ,
      ),
    );
  }

  ///------------------------------------------------------------------- picker

  void _showFromDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1 ),
      lastDate: DateTime(DateTime.now().year + 1 ),
    );


    setState(() {
      /// update value
      selectedDateFrom = formatDate(pickedDate);

      updateIsValid();

      /// callback
      widget.listener( isValidToDateDateGreaterThanFromDate, selectedDateFrom, selectedDateTo );

    });
  }


  void _showToDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1 ),
      lastDate: DateTime(DateTime.now().year + 1 ),
    );

    setState(() {

      /// update value
      selectedDateTo = formatDate(pickedDate);
      Log.i("_showToDatePicker() - selectedDateTo: $selectedDateTo /pickedDate: $pickedDate");


      updateIsValid();

      /// callback
      widget.listener( isValidToDateDateGreaterThanFromDate, selectedDateFrom, selectedDateTo );

    });
  }

  ///------------------------------------------------------- format & validate

  String? formatDate(DateTime? date) {
    if (date == null) return null;
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void updateIsValid() {

    /// case just select one item
    if( selectedDateFrom == null || selectedDateTo == null ){
      isValidToDateDateGreaterThanFromDate = true;
      return;
    }


    isValidToDateDateGreaterThanFromDate = checkTime1GreaterThanOrEqualTime2(selectedDateTo!, selectedDateFrom!  );
  }

  static bool checkTime1GreaterThanOrEqualTime2(String time1, String time2) {
    try{
      DateTime checkDate1 = DateFormat("yyyy-MM-dd").parse(time1);
      DateTime checkDate2 = DateFormat("yyyy-MM-dd").parse(time2);

      if (checkDate1.isAfter(checkDate2)) {
        return true;
      } else if (checkDate1.isBefore(checkDate2)) {
        return false;
      } else {
        return true;
      }
    } catch( e) {
      return false;
    }

  }


}