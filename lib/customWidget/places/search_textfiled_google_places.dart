
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/textfield_error/ErrorInputFieldParser.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/places/core/model/response_google_places.dart';
import 'package:fastor_app_ui_widget/customWidget/places/widget/google_places_search_controller.dart';
import 'package:fastor_app_ui_widget/customWidget/places/widget/list_view_google_places.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/TextFieldOnCompleteController.dart';
import 'package:flutter/material.dart';

typedef OnPlaceSelected = Function(PlaceResult place);

class SearchTextFiledGooglePlaces extends StatefulWidget {

  final TextEditingController controller;
  final double width;
  final String googleAPIKey;
  final String? hint;
  final OnPlaceSelected  onPlaceSelected;

  ///errors
  final String? errorKeySearchingInErrorMessageArray;
  final Map<String, dynamic>? errorsMessageArray;

  SearchTextFiledGooglePlaces({
    required this.width,
    required this.controller,
    required this.googleAPIKey,
    this.hint,
    required this.onPlaceSelected,

    ///errors
    this.errorKeySearchingInErrorMessageArray,
    this.errorsMessageArray
  });

  @override
  SearchTextFiledGooglePlacesState createState() => SearchTextFiledGooglePlacesState();
}

class SearchTextFiledGooglePlacesState extends State<SearchTextFiledGooglePlaces> {

  var onCompleteHandler = TextFieldOnCompleteController();
  List<PlaceResult> searchResults = [];
  bool isSearching = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: widget.width,
        child: TextField(
          focusNode: _focusNode,
          style: TextStyle(
            color: AppColors.textFieldText,
            fontSize: Figma.h( 16 ),
            fontFamily: FontProject.w400,
          ),
          onChanged: ( newValue ) {
            // Log.i("SearchTextFiledGooglePlaces - onChanged: $newValue");
            onChangeHappenedOrOnSubmitButtonClicked(widget.controller.text);
          },
          onSubmitted: ( value ) {
            // Handle search icon click on keyboard
            _startNowSearch( value );
          },
          controller: widget.controller,
          minLines: 1,
          maxLines: 1,
          keyboardType:   TextInputType.text,
          textInputAction: TextInputAction.search,
          decoration: getInputDecoration(),
          // onChanged: onChanged,
        ),
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: widget.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, 60.h),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(AppDimension.textFieldRadiusBoarder),
            child: Container(
              constraints: BoxConstraints(maxHeight: 300.h),
              decoration: BoxDecoration(
                color: AppColors.textFieldBackground,
                borderRadius: BorderRadius.circular(AppDimension.textFieldRadiusBoarder),
                border: Border.all(color: AppColors.textFieldBoarder),
              ),
              child: ListViewGooglePlaces(
                searchResults: searchResults,
                onPlaceSelected: _onPlaceItemSelected,
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  /// Handle place selection from the list
  void _onPlaceItemSelected(PlaceResult place) {
    // Set the text field value
    widget.controller.text = place.description;
    _removeOverlay();
    _focusNode.unfocus();

    // Call the callback if provided with lat/lng already available
    if (place.lat != null && place.lng != null) {
      widget.onPlaceSelected?.call( place );
    }
  }

  // Helper method to access extension methods
  Future<List<PlaceResult>?> _performGoogleSearchPlaces(String textToSearch) async {
    return widget.performGoogleSearchPlaces(textToSearch);
  }



  getInputDecoration() {
    return  InputDecoration(
        fillColor: AppColors.textFieldBackground,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.5.h , vertical: 22.h ),
        hintText: widget.hint??"Search".tr() ,
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
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),

        suffixIcon: GestureDetector(
          onTap: () {
            _startNowSearch( widget.controller.text);
          },
          child: Container(
              width: 24.w,
              height: 24.w,
              alignment: Alignment.center,
              child: isSearching
                ? SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  )
                : Icon( Icons.search_sharp,
                    size: 24.w,
                    color: AppColors.primary,
                  )
          ),
        )
    );
  }

  //--------------------------------------------------------- error

  String? getErrorMessage(){
    return ErrorInputFieldParser.getErrorMessage(array: widget.errorsMessageArray, key: widget.errorKeySearchingInErrorMessageArray);
  }


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

  ///--------------------------------------------------------- search action

  onChangeHappenedOrOnSubmitButtonClicked(String s ) {
    onCompleteHandler.onChange(s,  callback: (textWritten) async {
      await _startNowSearch( textWritten);
    });
  }


  Future _startNowSearch(String textWritten) async {
    Log.i("_startNowSearch() - textWritten: $textWritten");

    if (textWritten.isEmpty) {
      setState(() {
        searchResults = [];
        isSearching = false;
      });
      _removeOverlay();
      return;
    }

    setState(() {
      isSearching = true;
    });

    var result = await _performGoogleSearchPlaces(textWritten);

    setState(() {
      isSearching = false;
      if (result != null) {
        searchResults = result;
        if (searchResults.isNotEmpty && mounted) {
          _showOverlay(context);
        } else {
          _removeOverlay();
        }
      } else {
        searchResults = [];
        _removeOverlay();
      }
    });
  }


}