import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/date/icon_date/icon_date_picker_custom.dart';
import 'package:fastor_app_ui_widget/core/resource/AppDecoration.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


class IconAndSelectedDateWidget extends StatefulWidget {


  String? previousDateSelected;
  IconDatePickerListener listener;

  IconAndSelectedDateWidget( {
    required this.listener,
    this.previousDateSelected
  });

  @override
  State<StatefulWidget> createState() => _IconAndSelectedDateState();

}

class _IconAndSelectedDateState extends State<IconAndSelectedDateWidget> {

  String? selectedDate;

  @override
  void initState() {
    selectedDate = widget.previousDateSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        if( selectedDate != null )showPreviousDateSelected(),

        if( selectedDate != null )SizedBox(
            width: 5.wr,
          ),
          IconDatePickerCustom(
            listener: (date) async {
              setState(() {
                selectedDate = date;
                widget.listener(date);
              });
            },
          ),

    ],);
  }


  showPreviousDateSelected( ) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedDate = null;
          widget.listener(null );
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 5.wr, vertical: 5.hr),
        decoration: AppDecoration.dialogWhite(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cancel_outlined,
              size: 12.hr,
              color: ColorResource.greenDark,
            ),
            SizedBox(
              width: 8.hr,
            ),
            TextApp(
              selectedDate ?? "date filtered".tra(),
              color: ColorResource.greenDark,
              fontSize: 10.hr,
            ),
          ],
        ),
      ),
    );
  }


}
