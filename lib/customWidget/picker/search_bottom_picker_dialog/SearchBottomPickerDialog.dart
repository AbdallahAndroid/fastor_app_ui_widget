

import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/KeyboardTools.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/column/ColumnApp.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog/DialogMessageAwesomeHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog/shared/title_and_back_dialog.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog/shared/title_dialog.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog/shared/touch_cancel_dialog.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/search_bottom_picker_dialog/logic/BottomPickerController.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/search_bottom_picker_dialog/widget/ItemSelectedOrUnSelectedShape.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/listener/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/scaffold/ScaffoldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/TextFieldOnCompleteController.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/search/search_project_textfield.dart';

import 'package:flutter/material.dart';

enum BottomPickerShapeEnum {  confirmBottom, oneClick}

class SearchBottomPickerDialog extends StatefulWidget {

  double? heightListviewFixed ; //

  BottomPickerShapeEnum? bottomPickerShape;

  String? previousSelectedId;
  DataPickerEntity? previousSelectedEntity;

  String titleDialog;
  List<DataPickerEntity> dataEntities;
  ListViewDialogPickerGenericListener listener;


  SearchBottomPickerDialog({
    required this.titleDialog,
    required this.dataEntities,
    required this.listener,
    this.previousSelectedId,
    this.bottomPickerShape
  }){
    bottomPickerShape ??= BottomPickerShapeEnum.confirmBottom;
    setDefaultHeightFixedIfNeeded();
    setPreviousSelectedIfFound();
  }

  setDefaultHeightFixedIfNeeded(){
    if( dataEntities.length > 5) {
      heightListviewFixed  =  (5 * ItemSelectedOrUnSelectedShape.height )  + Figma.h(16 * 4) ;
    }
  }


  void setPreviousSelectedIfFound() {
    if(  previousSelectedId == null ) return;
    for( var entity in  dataEntities ) {
      if (entity.id ==  previousSelectedId) {
        previousSelectedEntity = entity;
        break;
      }
    }
  }


  @override
  SearchBottomPickerDialogState createState()  => SearchBottomPickerDialogState(previousSelectedEntity);
}

class SearchBottomPickerDialogState extends State<SearchBottomPickerDialog> {

  //---------------------------------------------------------------- variable

  var onCompleteHandler = TextFieldOnCompleteController();

  int indexListview = 0;
  DataPickerEntity? selectedEntity;

  TextEditingController controllerSearch = TextEditingController();

  SearchBottomPickerDialogState(DataPickerEntity? previousSelectedEntity){
    selectedEntity =  previousSelectedEntity;
  }

  //---------------------------------------------------------------- ui

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
        shapeTransparentColor: AppColors.dialogDialogDismissAreaTypeNormal,
        shapeTransparent: true,
        backgroundColor: AppColors.dialogDialogDismissAreaTypeNormal,
        body: Container(
          height: DeviceTools.getHeight(context),
          width:  DeviceTools.getWidth(context), //MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Directionality(
            textDirection: LangApp.getTextDirection(),
            child: cardUI(),
          ),
      )
    );
  }

  //---------------------------------------------------------------- card ui

  Widget cardUI(){
    return Container(
      decoration: AppDecoration.bottomSheetDecoration(),
      padding: AppDimension.paddingDialogBottomSheet,
      constraints: BoxConstraints(
          maxWidth: AppDimension.dialogPickerWidthCard(context!) ,
          maxHeight: DeviceTools.getPercentageHeight(context, 90 )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          /// touch + title
          TouchCancelDialog(),
          SizedBox( height: 10.h ,),
          TitleAndBackDialog(title: widget.titleDialog,
            width: DeviceTools.getWidth(context),
          ),
          SizedBox( height: 16.h ,),

          /// search
          Container(
            width: DeviceTools.getWidth(context),
            alignment: Alignment.center,//LangApp.getAlignmentGeometryStartCenter(),
            child: SearchProjectTextField(
              width: AppDimension.dialogPickerWidthInputField(context) ,
              controller: controllerSearch,
              onChanged: (s ){
                onCompleteHandler.onChange(s,  callback: (textWritten) {
                  _onFinishSearchByTest();
                });
              },
              onClickSearch: (){
               _onFinishSearchByTest();
              },
            ),
          ),
          SizedBox( height:  20.h ,),

          /// list
          listViewItems(),
          SizedBox( height: 20.h ,),

          /// confimr
          if( widget.bottomPickerShape! == BottomPickerShapeEnum.confirmBottom ) buttonChoose(),
          if( widget.bottomPickerShape! == BottomPickerShapeEnum.confirmBottom ) SizedBox(height: Figma.h(16),),
        ],
    )
    );
  }






  //--------------------------------------------------------------- list view

  Widget listViewItems( ) {
    indexListview = 0;
    return Expanded(
        child: ListView.builder(
          // separatorBuilder: ( ctx, index ) => SizedBox( height: 8.h ,),
          padding: EdgeInsets.zero,
          itemCount: widget.dataEntities.length,
          itemBuilder: (ctx, index )   {
            var entity = widget.dataEntities[index];
            updateValueOfEntityWhileLoadingBuilder(entity);
            if(isSearchTextFound(  ) ) {
              if( isSearchTextContainThisEntity(entity) ) {
                return itemListPicker(entity);
              } else {
                return SizedBox();
              }

            } else {
              return itemListPicker( entity);
            }
          })
    );
  }


  bool isSearchTextFound(   ) {
    return ToolsValidation.isName( controllerSearch.text );
  }


  bool isSearchTextContainThisEntity(DataPickerEntity entity){
    String textAtSearch = controllerSearch.text??"";
    if(entity.title == null ) return false;
    if(textAtSearch == "" ) return false;
    return entity.title!.contains( textAtSearch) ;
  }


  Widget itemListPicker(DataPickerEntity entity) {
    return   Container(
      margin: EdgeInsets.only(bottom: 8.h ),
      child:   ItemSelectedOrUnSelectedShape(
        entity: entity,
        isHideImage: false  ,
        listener: (DataPickerEntity entity ){
          //print("BottomPickerDialog - click - entity: $entity");
          setState(() {
            selectedEntity = entity;
            inCaseShapeOneSingleClickAutoDismissDialog();
          });
        },
      ),
    );
  }


  Widget buttonChoose(){
    return ButtonApp( "Confirm".tr(), () {
      Log.i("buttonChoose - confirm - selectedEntity: $selectedEntity");
      if(selectedEntity == null ) {
        DialogMessageAwesomeHelper.justMessage(context,  "choose one item".tr() );
        return;
      }
      successSelectAndDismissDialog();
    },
      // fontFamily: FontProject.w700,
      width: DeviceTools.isLandscapeOrSemiBox(context ) ? 300.w :  DeviceTools.getWidth(context),
      // height: Figma.h(52),
      // fon: Figma.h(16),
    );
  }

  void _onFinishSearchByTest() {
    ToolsKeyboard.dismiss(context);
    setState(() {

    });
  }




}