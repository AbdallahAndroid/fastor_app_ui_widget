// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:maqsafy/core/constants/assets/app_icons.dart';
// import 'package:maqsafy/core/responsive/dimension.dart';
// import 'package:maqsafy/core/theme/app_colors.dart';
// import 'package:maqsafy/core/theme/app_text_styles.dart';
// import 'package:maqsafy/core/utils/KeyboardTools.dart';
// import 'package:maqsafy/core/utils/device/DeviceTools.dart';
// import 'package:maqsafy/core/utils/device/responsive_helper.dart';
// import 'package:maqsafy/core/utils/log/Log.dart';
// import 'package:maqsafy/core/utils/values/ToolsNumber.dart';
// import 'package:maqsafy/core/widgets/app_input_fields/Textfield_on_complete_controller.dart';
// import 'package:maqsafy/core/widgets/progress/progress_circle.dart';
// import 'package:maqsafy/core/widgets/text/app_text.dart';
//
// class NfcTextField extends StatelessWidget {
//   final double iconSize;
//
//   TextFieldOnCompleteController onCompleteHandler =
//       TextFieldOnCompleteController(timeToWait: 70);
//
//   final TextEditingController controller;
//   final double maxHeight;
//   final double? maxWidth;
//   final double? width;
//   final String? hint;
//   final String? errorMessage;
//   final ValueChanged<String> onFieldSubmitted;
//   final ValueChanged<String> onChanged;
//   final void Function() onCancelSearch;
//   final bool showProgress;
//   final FocusNode focusNode;
//   final AutovalidateMode? autovalidateMode;
//   final EdgeInsets? contentPadding;
//
//   var rawCharacters = "";
//
//   NfcTextField({
//     required this.controller,
//     required this.maxHeight,
//     required this.onFieldSubmitted,
//     required this.onChanged,
//     required this.onCancelSearch,
//     this.errorMessage,
//     this.contentPadding,
//     this.autovalidateMode,
//     this.width,
//     required this.focusNode,
//     this.showProgress = false,
//     this.maxWidth,
//     this.hint,
//     double? iconSize,
//     Key? key,
//   })  : iconSize = iconSize ?? 16.hr,
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             constraints: BoxConstraints(
//                 maxWidth: width ?? maxWidth ?? DeviceTools.getWidth(context)),
//
//             /**
//              * ++++++++++++++++ NFC Keyboard
//              * success listener on raw of textfield with hidden keyboard
//              */
//             child: KeyboardListener(
//               focusNode: focusNode,
//               autofocus: true,
//               child: textFieldSearch(context),
//               onKeyEvent: (event) {
//                 Log.k("KeyboardTools",
//                     "RawKeyboardListener - event: ${event.character}");
//
//                 if (event.character != null) {
//                   rawCharacters += event.character!;
//
//                   onChangeHappenedOrOnSubmitButtonClicked(rawCharacters);
//                 }
//               },
//             ),
//           ),
//
//           /// error
//           if (errorMessage != null)
//             SizedBox(
//               height: 5.hr,
//             ),
//           if (errorMessage != null)
//             AppText(
//               errorMessage ?? "",
//               textStyle: AppTextStyles.font8Red500,
//             )
//         ],
//       ),
//     );
//   }
//
//   Widget textFieldSearch(BuildContext context) {
//     return TextFormField(
//       enableInteractiveSelection: false,
//       controller: controller,
//       cursorColor: AppColors.text,
//       keyboardType: TextInputType.name,
//
//       ///keyboard nfc config
//       showCursor: true,
//       readOnly: true,
//       autofocus: true,
//       // THIS makes the cursor appear
//       // focusNode: focusNode,
//
//       /// field submit tap
//       onFieldSubmitted: onFieldSubmitted,
//       textInputAction: TextInputAction.search,
//
//       autovalidateMode: autovalidateMode,
//       onChanged: (value) {
//         onChanged(value);
//       },
//
//       ///when user click search button keyboard
//       style: TextStyle(fontSize: 14.hr),
//
//       decoration: InputDecoration(
//           isDense: true,
//           hintText: hint ?? '',
//           filled: true,
//           fillColor: Colors.white,
//           hintStyle: TextStyle(
//               color: AppColors.textShade200,
//               fontSize: 14.hr,
//               fontWeight: FontWeight.w500),
//           contentPadding: contentPadding ?? EdgeInsets.all(10),
//           suffixIcon: showProgress
//               ? progressView(context)
//               : searchAndCancelIcons(context),
//           suffixIconConstraints: BoxConstraints(maxWidth: iconSize + 90.wr),
//           constraints: BoxConstraints(
//             maxHeight: maxHeight,
//             minWidth: width ?? 20,
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.borderShade100, width: 1),
//             borderRadius: BorderRadius.circular(8.hr),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.primary),
//             borderRadius: BorderRadius.circular(8.hr),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.borderShade100, width: 1),
//             borderRadius: BorderRadius.circular(8.hr),
//           ),
//           errorStyle: TextStyle(fontSize: 8.hr)),
//     );
//   }
//
//   Widget searchAndCancelIcons(BuildContext context) => Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           /// search icon
//           Container(
//             // color: Colors.yellow,
//             width: iconSize,
//             margin: EdgeInsetsDirectional.only(end: 10.w),
//             child: IconButton(
//               padding: EdgeInsets.zero,
//               onPressed: () {
//                 onFieldSubmitted(controller.text);
//               },
//               icon: SvgPicture.asset(
//                 AppIcons.searchIcon2,
//                 width: iconSize,
//                 height: iconSize,
//               ),
//             ),
//           ),
//
//           /// cancel
//           Visibility(
//             visible: controller.text.isNotEmpty,
//             child: Container(
//               // color: Colors.green,
//               width: iconSize,
//               margin: EdgeInsetsDirectional.only(end: 10.w),
//               child: IconButton(
//                 onPressed: () {
//                   // KeyboardTools.dismiss(context);
//                   controller.clear();
//                   onCancelSearch();
//                 },
//                 icon: Icon(
//                   Icons.cancel_outlined,
//                   size: iconSize,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//
//   progressView(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10.wr),
//       width: iconSize,
//       height: iconSize,
//       child: ProgressCircle(
//         size: ResponsiveHelper.isPhoneSmall(context) ? 12.hr : iconSize,
//       ),
//     );
//   }
//
//   void onChangeHappenedOrOnSubmitButtonClicked(String s) {
//     onCompleteHandler.onChange(s, callback: (textWritten) {
//       Log.k("KeyboardTools",
//           "onChangeHappenedOrOnSubmitButtonClicked complete insert: ${textWritten}");
//       rawCharacters = "";
//       var englishText = ToolsNumber.convertArabicToEnglishNumbers(textWritten);
//
//       controller.text = englishText;
//       onFieldSubmitted(englishText);
//     });
//   }
// }
