import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/date/from_to/widget/date_hint_box_tab.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


typedef DateFromToPickerListener = Function(String? selectedFrom, String? selectedTo);

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
                hint:  "From".tra(),
                previousSelected: selectedDateFrom,
                width: 165.wr,
                onTap:  () => _showFromDatePicker(context),
              ),

              DateHintBoxTab(
                hint:  "To".tra(),
                previousSelected: selectedDateTo,
                width: 165.wr,
                onTap:  () => _showToDatePicker(context),
              )

            ],
          ),

        ],
      ),
    ) ;
  }


  void _showFromDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 20 ),
      lastDate:  DateTime.now(),
    );

    /// update value
    selectedDateFrom = formatDate(pickedDate);

    /// callback
    widget.listener( selectedDateFrom, selectedDateTo );
  }

  void _showToDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 20 ),
      lastDate:DateTime.now(),
    );

    /// update value
    selectedDateTo = formatDate(pickedDate);

    /// callback
    widget.listener( selectedDateFrom, selectedDateTo );
  }

  String? formatDate(DateTime? date) {
    if (date == null) return null;
    return DateFormat('yyyy-MM-dd').format(date);
  }


}