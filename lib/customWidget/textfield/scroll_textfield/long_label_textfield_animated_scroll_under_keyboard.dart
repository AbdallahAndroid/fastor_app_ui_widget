
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/error_text/error_textfield.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:flutter/material.dart';

typedef  KeyboardChangeStatusCallback =  Function(bool isKeyboardVisible );
typedef  ScrollChangeStatusCallback =  Function(  bool isScrollingEnd );

class LongLabelTextFieldAnimatedScrollUnderKeyboard extends StatelessWidget {

  final String label;
  final String hint;
  final ValueChanged<String> onChanged;

  //error
  final Map<String, dynamic>? errorsMessageArray;
  final String? errorKeySearchingInErrorMessageArray;
  String? messageError;

  final TextEditingController? controller;
  final ScrollController? scrollController ;


  // FocusNode  focusNode = FocusNode();
  // KeyboardChangeStatusCallback?  keyboardChangeStatusCallback ;
  // ScrollChangeStatusCallback ? scrollChangeStatusCallback ;

  // Position TextField at top of visible area, default is 0.0
  double? scrollPosition;

  LongLabelTextFieldAnimatedScrollUnderKeyboard({
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.scrollPosition,

    /// fix problem the bottom sheet hide text behind it , so we need to hide bottom sheet  closing when click on textfield
    this.controller,
    this.scrollController,
    //   this.keyboardChangeStatusCallback,
    // this.scrollChangeStatusCallback,


    this.messageError,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
  }) {
    messageError ??= getMessageErrorFromErrorsArray();
  }


  String? getMessageErrorFromErrorsArray(){
    if( messageError != null) return  messageError;
    if( errorKeySearchingInErrorMessageArray == null) return null;
    if( errorsMessageArray == null) return null;
    return  errorsMessageArray!.keys.contains( errorKeySearchingInErrorMessageArray)
        ?  errorsMessageArray![ errorKeySearchingInErrorMessageArray][0]
        : null;
  }


  @override
  Widget build(BuildContext context) {
    return  Directionality(
        textDirection: LangApp.getTextDirection(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AutomatedStatfullWidget(
              label: label,
              hint: hint,
              onChanged: onChanged,
              scrollPosition: scrollPosition,
              controller: controller,
              scrollController: scrollController,
            ),
            if( messageError != null ) ErrorTextfield( messageError??""),

          ],
        )
    );
  }

}


class _AutomatedStatfullWidget extends StatefulWidget {

  final String label;
  final String hint;
  final ValueChanged<String> onChanged;

  final TextEditingController? controller;
  final ScrollController? scrollController ;


  // Position TextField at top of visible area, default is 0.0
  double? scrollPosition;

  _AutomatedStatfullWidget({
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.scrollPosition,

    /// fix problem the bottom sheet hide text behind it , so we need to hide bottom sheet  closing when click on textfield
    this.controller,
    this.scrollController,
  });

  @override
  State<_AutomatedStatfullWidget> createState() => _LongLabelTextFieldAnimatedScrollUnderKeyboardState();
}


class _LongLabelTextFieldAnimatedScrollUnderKeyboardState
    extends State<_AutomatedStatfullWidget>
    with WidgetsBindingObserver {

  final FocusNode _focusNode = FocusNode();
  final GlobalKey _textFieldKey = GlobalKey();
  // double _previousKeyboardHeight = 0;

  String tag = "AnimatedKeyboardScrollTextField";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

      _focusNode.addListener( (){
        Log.k( tag, "_onFocusChange() _focusNode.hasFocus: ${_focusNode.hasFocus}");
        if (_focusNode.hasFocus) {
          _scrollToTextField();
        }
      });


    });

  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        Log.k(tag, "didChangeMetrics() keyboardHeight: $keyboardHeight / hasFocus: ${_focusNode.hasFocus}");

        // Keyboard just appeared (including reopening after dismiss)
        if (  _focusNode.hasFocus) {
          Log.k(tag, "didChangeMetrics() keyboard appeared, scrolling to TextField");
          _scrollToTextField();
        }
      } else {
        Log.k(tag, "didChangeMetrics() not mounted");
      }
    });
  }


  void _scrollToTextField() {
    Log.k( tag, "_scrollToTextField() called, scrolling to TextField");
    // Delay to allow keyboard to fully appear
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_textFieldKey.currentContext != null && mounted) {
        final RenderBox? renderBox = _textFieldKey.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null && widget.scrollController != null) {
          // Get TextField position relative to scroll view
          final RenderObject? scrollableRenderObject = Scrollable.of(_textFieldKey.currentContext!).context.findRenderObject();
          if (scrollableRenderObject != null) {
            final offset = renderBox.localToGlobal(Offset.zero, ancestor: scrollableRenderObject);

            // Calculate target: scroll so TextField bottom + small padding is visible
            final targetOffset = widget.scrollController!.offset + offset.dy - 20.0; // 20px padding above TextField
            Log.k( tag, "_scrollToTextField() offset: $offset /targetOffset: $targetOffset");

            widget.scrollController!.animateTo(
              targetOffset.clamp(0.0, widget.scrollController!.position.maxScrollExtent),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            return;
          }
        }

        // Fallback to ensureVisible
        Scrollable.ensureVisible(
          _textFieldKey.currentContext!,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: widget.scrollPosition ?? 0.1, // Position TextField near top with small margin
        );
      } else {
        Log.k( tag, "_scrollToTextField() not allowed");
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        key: _textFieldKey,
        child: TextFieldApp(
          controller:  widget.controller,
          focusNode: _focusNode,
          fontSize: 16.sp ,
          textAlign : TextAlign.start,
          // textAlignVertical: TextAlignVertical.top,
          fontFamily: FontProject.w400,

          /// the height of figma is 126.h in content
          minLines: 5,
          maxLines: 5,
          onChanged: ( t){
            // _scrollToTextField();
            widget.onChanged(t );
          },
          isRemoveUnderline: true,
          showOutlineInput: true,
          decoration: InputDecoration(

              alignLabelWithHint: true ,
              contentPadding: EdgeInsets.symmetric( horizontal: 14.w, vertical:  16.5.h ),

              /// boarder
              ///    >> // Set all border types to your defined gray border
              border: grayBorder(),
              enabledBorder: grayBorder(),
              focusedBorder: grayBorder(),
              disabledBorder: grayBorder(), // Optional: if you want disabled state to also have the same border
              errorBorder: grayBorder(), // Optional: if you want error state to also have the same border
              focusedErrorBorder: grayBorder(), // Optional: if you want focused error state to also have the same border

              /// color background
              filled: true ,
              fillColor: AppColors.textFieldBackground,

              /// label
              floatingLabelBehavior: FloatingLabelBehavior.always, // Make the label always float above the input field
              label: TextApp( " " +  widget.label +  " "  ,
                fontFamily: FontProject.w400,
                fontSize: 12.sp ,
                color: AppColors.textFieldLabel,
              ),

              // errorText: getMessageErrorFromErrorsArray(),

              /// hint
              hintText: widget.hint,
              hintStyle: TextStyle(
                  fontSize: 16.sp ,
                  fontFamily: FontProject.w400,
                  color: AppColors.textFieldHint
              )
          ),
        ),
      );
  }


  grayBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular( 12.r ),
      borderSide: BorderSide(color: AppColors.textFieldBoarder, width: AppDimension.textFieldBoarderWidth),
    );
  }


}