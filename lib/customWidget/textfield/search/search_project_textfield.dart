import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/textfield_error/ErrorInputFieldParser.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:flutter/material.dart';


class SearchProjectTextField extends StatelessWidget {


  BuildContext? context;
  double width;


  TextEditingController controller;
  // ValueChanged<String>  onClickSearch;
  GestureTapCallback onClickSearch;
  TextInputType? textInputType;
  double? radius;


  int? minLines;
  int? maxLength;
  String? hint;

  ///errors
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;

  ValueChanged<String>? onChanged;

  SearchProjectTextField( {

    required this.width,

    required this.controller,
    required this.onClickSearch,
    this.textInputType,
    this.onChanged,

    this.minLines,
    this.maxLength,

    this.hint,

    /// boarder
    this.radius,

    ///errors
    this.errorKeySearchingInErrorMessageArray,
    this.errorsMessageArray
  });


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return  SizedBox(
      width: width,
      child: TextField(
        style: TextStyle(
          color: AppColors.textFieldText,
          fontSize: Figma.h( 16 ),
          fontFamily: FontProject.w400,
        ),
        controller: controller,
        minLines: minLines,
        maxLength: maxLength,
        onChanged:  onChanged,
        decoration: getInputDecoration(),
        // onChanged: onChanged,
      ),
    );
  }


  String? getErrorMessage(){
    return ErrorInputFieldParser.getErrorMessage(array: errorsMessageArray, key: errorKeySearchingInErrorMessageArray);
  }


  getInputDecoration() {
    return  InputDecoration(
        fillColor: AppColors.textFieldBackground,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.5.h , vertical: 22.h ),
        hintText: hint??"Search".tr() ,
        hintStyle: TextStyle(
          color: AppColors.textFieldDialogHint ,
          fontFamily: FontProject.w400,
          fontSize: 16.sp
        ),
        labelStyle: TextStyle(
            color: AppColors.textFieldHint ,
            fontFamily: FontProject.w400,
            fontSize: 16.sp
        ) ,
        errorText: getErrorMessage(),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimension.textFieldRadiusBoarder),
          borderSide: BorderSide(
            color: AppColors.textFieldBoarder, // o
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimension.textFieldRadiusBoarder),
          borderSide: BorderSide(
            color: AppColors.textFieldBoarder,
          ),
        ),


        //   Error (not focused)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimension.textFieldRadiusBoarder),
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimension.textFieldRadiusBoarder),
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),

        suffixIcon: GestureDetector(
          onTap: onClickSearch,
          child: Container(
              width: 24.w,
              height: 24.w,
              alignment: Alignment.center,
              child: Icon( Icons.search_sharp,
                size: 24.w,
                color: AppColors.primary,
              )
          ),
        )
    );
  }

  //--------------------------------------------------------- prefix

  Widget? prefixWidget(){
    if( getErrorMessage() == null ) return null;

    return Container(
      // color: Colors.green.withOpacity(0.5),
      //
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: minLines != null ?  CrossAxisAlignment.start : CrossAxisAlignment.center ,
        children: [
          Icon( Icons.add),


        ],),
    );
  }


  Widget divider(){
    var heightDivider = 25.0;
    if( minLines != null ) {
      heightDivider = minLines! * 20;
    }
    return Container(
      width: 2,
      height: heightDivider,
      color: AppColors.textFieldHint,
    ) ;
  }

  //--------------------------------------------------------- error

  errorMessageWidget(){
    double size = Figma.h( 10);
    Log.i("errorMessageWidget() - getErrorMessage: ${getErrorMessage()}");
    if( getErrorMessage() == null ) return SizedBox();

    return Container(
      // width: width,
      // color: Colors.blue.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Icon( Icons.info_outline, size: size, color: AppColor.red,),
          // SizedBox( width:  5 ,),
          TextApp( getErrorMessage()??"",
            color: AppColors.red,
            fontSize: size,
            // fontFamily: FontResource.regular,
          ),

        ],
      ),
    );
  }


//
  // double width;
  // TextEditingController? controller;
  //
  // /// errors
  // String? errorMessage;
  // String? errorKeySearchingInErrorMessageArray;
  // Map<String, dynamic>? errorsMessageArray;

  // UsernameAqarTextfield({
  //   required this.width,
  //   this.controller,
  //
  //   /// errors
  //   this.errorsMessageArray,
  //   this.errorKeySearchingInErrorMessageArray,
  //   this.errorMessage,
  // });
  //
  // @override
  // Widget build(BuildContext context) {
  //   // Log.i("AuthMobile -errorKeySearchingInErrorMessageArray: $errorKeySearchingInErrorMessageArray /array: $errorsMessageArray");
  //   return TextFieldApp(
  //     width: width,
  //     controller: controller,
  //     errorsMessageArray: errorsMessageArray,
  //     errorKeySearchingInErrorMessageArray: errorKeySearchingInErrorMessageArray,
  //     errorMessage: errorMessage,
  //     hint_text: "username".tr(),
  //     fontSize: 16.sp ,
  //     fontFamily: FontProject.w400,
  //     text_color: AppColor.textColor,
  //     hint_color: AppColor.textFieldDialogHint,
  //     showOutlineInput: true ,
  //     decorationBackground: AppDecoration.textField(),
  //     // decoration: InputDecoration(
  //     //   hintText:  "username".tr(),
  //     //   filled: true,
  //     //   fillColor: AppColor.textFieldBackground,
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(AppDimension.textFieldRadiusBoarder),
  //         borderSide: BorderSide(
  //           color: AppColor.textFieldBoarder, // o
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(AppDimension.textFieldRadiusBoarder),
  //         borderSide: BorderSide(
  //           color: AppColor.textFieldBoarder,
  //         ),
  //       ),
  //     // ),
  //     prefixIcon: Container(
  //       width: 24.w,
  //       height: 56.w ,
  //       alignment: Alignment.center,
  //       child: Image.asset( "assets/icons/textfield_username.png",
  //         width: 24.w,
  //         height: 24.w,
  //       )
  //     ),
  //   );
  //
  // }
}