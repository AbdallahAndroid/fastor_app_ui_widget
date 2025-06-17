import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef IconDatePickerListener = Function(String? selected);

class IconDatePickerCustom extends StatelessWidget {
  IconDatePickerListener listener;

  IconDatePickerCustom({required this.listener});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialogPickerDate(context);
      },
      child: Icon(
        Icons.date_range_sharp,
        size: 24.wr,
        color: ColorResource.greenDark,
      ),
    );
  }

  //---------------------------------------------------------

  Future showDialogPickerDate(BuildContext context) async {

    DateTime? selectTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1975),
        lastDate: DateTime(2100));
    if (selectTime != null) {
      timeSelectedChangeTo(selectTime);
    } else {
      listener(null );
    }
  }

  Future timeSelectedChangeTo(DateTime dateTime) async {
    var _selectedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    listener(_selectedDate);
  }
}
