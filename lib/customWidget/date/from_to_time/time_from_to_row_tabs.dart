import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/date/from_to_time/widget/time_hint_box_tab.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef TimeFromToPickerListener = Function(bool  isValidToTimeGreaterThanFromTime, String? selectedFrom, String? selectedTo);

class TimeFromToRowTabs extends StatefulWidget {


  String? previousTimeSelectedFrom;
  String? previousTimeSelectedTo;
  TimeFromToPickerListener listener;


  TimeFromToRowTabs( {
    required this.listener,
    this.previousTimeSelectedFrom,
    this.previousTimeSelectedTo
  });

  @override
  State<StatefulWidget> createState() => _DateFromToRowTabsState();


}

class _DateFromToRowTabsState extends State<TimeFromToRowTabs> {


  String? selectedFrom, selectedTo;

  bool  isValidToTimeGreaterThanFromTime = true  ;

  @override
  void initState() {
    selectedFrom = widget.previousTimeSelectedFrom;
    selectedTo = widget.previousTimeSelectedTo;
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
              TimeHintBoxTab(
                hint:  "From".tr(),
                previousSelected: selectedFrom,
                width: 165.wr,
                onTap:  () => _showFromPicker(context),
              ),

              TimeHintBoxTab(
                hint:  "To".tr(),
                previousSelected: selectedTo,
                width: 165.wr,
                onTap:  () => _showToPicker(context),
              )

            ],
          ),

          if( isValidToTimeGreaterThanFromTime == false ) errorMessage()

        ],
      ),
    ) ;
  }

  errorMessage() {
    return  Container(
      width: DeviceTools.getWidth(context),
      margin: EdgeInsets.only(top: 4.hr ),
      alignment: LangApp.getAlignmentGeometryStart(),
      child: TextApp( "Time 'From' Less Than Time 'To'".tr() ,
        color: ColorResource.red,
        fontSize: 14.sp ,
      ),
    );
  }

  ///------------------------------------------------------------------- picker

  void _showFromPicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      /// update value
      selectedFrom = formatTime(picked);

      updateIsValid();

      /// callback
      widget.listener( isValidToTimeGreaterThanFromTime, selectedFrom, selectedTo );

    });
  }


  void _showToPicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );


    setState(() {

      /// update value
      selectedTo = formatTime(picked);
      // Log.i("_showToPicker() - selectedDateTo: $selectedTo /pickedDate: $picked");


      updateIsValid();

      /// callback
      widget.listener( isValidToTimeGreaterThanFromTime, selectedFrom, selectedTo );

    });
  }

  ///------------------------------------------------------- format & validate

  /// convert  TimeOfDay to "HH:mm:ss" Format
  String? formatTime(TimeOfDay? time) {
    if (time == null) return null;
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return "${dateTime.hour.toString().padLeft(2, '0')}"
        ":${dateTime.minute.toString().padLeft(2, '0')}"
        ":00"; // No seconds in TimeOfDay, default to "00"
  }

  void updateIsValid() {

    /// case just select one item
    if( selectedFrom == null || selectedTo == null ){
      isValidToTimeGreaterThanFromTime = true;
      return;
    }


    isValidToTimeGreaterThanFromTime = checkTime1GreaterThanOrEqualTime2(selectedTo!, selectedFrom!  );
  }

  static bool checkTime1GreaterThanOrEqualTime2(String time1, String time2) {
    Duration toDuration(String time) {
      final parts = time.split(":").map(int.parse).toList();
      return Duration(hours: parts[0], minutes: parts[1], seconds: parts[2]);
    }

    final t1 = toDuration(time1);
    final t2 = toDuration(time2);

    return t1 >= t2;
  }


}