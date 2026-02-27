import 'package:fastor_app_ui_widget/admin/shared/text/admin_text_header.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/utils/ToolsKeyboard.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/customWidget/row/RowScrollApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/search/search_aqar_textfield.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/username/username_aqar_textfield.dart';
import 'package:flutter/material.dart';

class HeaderBarAdminPanel extends StatelessWidget {

  TextEditingController? controllerSearch;
  String title;
  GestureTapCallback?   onClickSearch;


  String? searchHint;
  TextInputType? textInputType;
  List<Widget>? leftChildren ;
  List<Widget>? rightChildren ;

  HeaderBarAdminPanel({
    required this.title,
    required this.controllerSearch,
    required this.onClickSearch,
    this.leftChildren,
    this.rightChildren,
    this.searchHint,
    this.textInputType
});


  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [


            /// title
            Container(
              margin: fixDropdownTitle(),
              child: AdminTextHeader( title ),
            ),

            /// left children
            if(leftChildren != null  && leftChildren!.isNotEmpty )SizedBox( width:  20.h ,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: leftChildren??[],
              ),
            ),

            /// search
            if(controllerSearch != null ) SizedBox( width:  20.h ,),
            if(controllerSearch != null ) Container(
              margin: fixDropdownTitle(),
              child: SearchAqarTextfield(
                hint: searchHint,
                width:  AppDimension.adminInputfieldSearchList(context)  ,
                textInputType: textInputType,
                controller: controllerSearch!,
                onClickSearch: (){
                  ToolsKeyboard.dismiss(context);
                  if(onClickSearch != null ) onClickSearch!();
                },
              ),
            ),

            /// right children
            if(rightChildren != null && rightChildren!.isNotEmpty )SizedBox( width:  20.h ,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: rightChildren??[],
              ),
            ),
            SizedBox( width:  20.h ,),


          ],
        ),
      ),
    );
  }


  EdgeInsets? fixDropdownTitle() {
    if( rightChildren == null ) return null;
    return  EdgeInsets.only(top: AppDimension.dropdownFloatingPaddingTopToFixTitleFloating );
  }


}