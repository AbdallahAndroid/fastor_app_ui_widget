
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/error_text/error_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IconTextInsideBoxFormatedNumberThousandsTextfield extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String label;
  final String? previousValue;
  final String suffixText;
  final String hintText;

  //error
  final Map<String, dynamic>? errorsMessageArray;
  final String? errorKeySearchingInErrorMessageArray;
  final String? errorMessage;

  const IconTextInsideBoxFormatedNumberThousandsTextfield({
    super.key,
    required this.label,
    required this.hintText,
    required this.suffixText,
    required this.previousValue,
    required this.onChanged,
    //errors
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
    this.errorMessage,
  });

  /// Format number with thousand separators (e.g., 9800700 -> 9,800,700)
  String _formatWithThousandSeparator(String value) {
    if (value.isEmpty) return value;
    // Remove existing commas
    String cleanValue = value.replaceAll(',', '');
    // Check if it's a valid number
    if (int.tryParse(cleanValue) == null) return value;
    // Add thousand separators
    String result = '';
    int count = 0;
    for (int i = cleanValue.length - 1; i >= 0; i--) {
      count++;
      result = cleanValue[i] + result;
      if (count % 3 == 0 && i != 0) {
        result = ',' + result;
      }
    }
    return result;
  }

  String? _getErrorMessageFromBackend() {
    if (errorMessage != null) return errorMessage;
    if (errorsMessageArray != null && errorKeySearchingInErrorMessageArray != null) {
      return errorsMessageArray!.keys.contains(errorKeySearchingInErrorMessageArray)
          ? errorsMessageArray![errorKeySearchingInErrorMessageArray][0]
          : null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final errorMsg = _getErrorMessageFromBackend();
    return Directionality(
      textDirection: LangApp.getTextDirection(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _textfieldBox(),
          if(errorMsg != null) ErrorTextfield(errorMsg)
        ],
      ),
    );
  }

  Widget _textfieldBox(){
    return Container(
      // decoration: AppDecoration.textFieldShapeDefault(),
      child: TextFormField(
        initialValue: _formatWithThousandSeparator(previousValue ?? ""),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          _ThousandSeparatorInputFormatter(),
        ],
        onChanged: (value) {
          // Return value without commas to the callback
          onChanged(value.replaceAll(',', ''));
        },
        style:   TextStyle(
          color: AppColors.textFieldText ,
          fontFamily: FontProject.w400,
          fontSize: 16.sp ,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:  TextStyle(
            color: AppColors.textFieldHint ,
            fontFamily: FontProject.w400,
            fontSize: 16.sp ,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 16.5.h ),
          // errorText: errorMessage,

          // filled: true,
          // fillColor:   AppColor.textFieldBackground,

          /// boarder
          border: _defaultBoarderShape(),
          focusedBorder: _defaultBoarderShape(),
          enabledBorder: _defaultBoarderShape(),
          errorBorder: _defaultBoarderShape(),

          /// color background
          filled: true ,
          fillColor: AppColors.textFieldBackground,

          /// label
          floatingLabelBehavior: FloatingLabelBehavior.always, // Make the label always float above the input field
          // labelText: label,
          label: TextApp( " " +  label +  " "  ,
            fontFamily: FontProject.w400,
            fontSize: 12.sp ,
            // backgroundColor: AppColor.textFieldBackground,
            color: AppColors.textFieldLabel,
          ),

          /// suffix
          suffixIcon: Container(
            width: 56.w,
            height: 56.w ,
            alignment: Alignment.center,
            decoration: BoarderHelper.cardView(
                colorBackground: AppColors.textFieldIcon2,
                radiusBorder: BorderRadiusTools.right( AppDimension.textFieldRadiusBoarder)
            ),
            child:   Container(
              width: 56.w,
              height: 56.w ,
              alignment: Alignment.center,
              child: Text(
                suffixText,
                style: TextStyle(
                  fontSize: 16.sp ,
                  color: AppColors.textFieldText,
                  fontFamily: FontProject.w600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _defaultBoarderShape() {
    // return OutlineInputBorder(
    //   borderRadius: BorderRadius.circular( AppDimension.textFieldRadiusBoarder, ),
    //   borderSide: BorderSide.none,
    // );
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular( AppDimension.textFieldRadiusBoarder,),
      borderSide: BorderSide(color: AppColors.textFieldBoarder, width: AppDimension.textFieldBoarderWidth ),
    );
  }
}

/// Custom TextInputFormatter to add thousand separators while typing
class _ThousandSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (newText.isEmpty) {
      return const TextEditingValue(text: '');
    }

    // Format with thousand separators
    String formatted = '';
    int count = 0;
    for (int i = newText.length - 1; i >= 0; i--) {
      count++;
      formatted = newText[i] + formatted;
      if (count % 3 == 0 && i != 0) {
        formatted = ',' + formatted;
      }
    }

    // Calculate new cursor position
    int cursorPosition = formatted.length;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
