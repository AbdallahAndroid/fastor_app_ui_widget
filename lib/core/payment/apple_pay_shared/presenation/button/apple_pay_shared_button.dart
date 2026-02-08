// import 'package:flutter/material.dart';
// import 'package:maqsafy/core/app_injections/app_injections.dart';
// import 'package:maqsafy/core/constants/localization/app_localization.dart';
// import 'package:maqsafy/core/flavor_config.dart';
// import 'package:maqsafy/core/responsive/dimension.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/core/apple_pay_plugin_helper.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/core/apple_pay_system_application_type.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/data/response/response_apple_pay_bottom_sheet.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/data/response/response_generate_apple_pay_session.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/domain/apple_pay_shared_repository_i.dart';
//
// import 'package:maqsafy/core/services/apple_pay_shared/presenation/button/logic/apple_pay_shared_logic.dart';
// import 'package:maqsafy/core/utils/log/Log.dart';
// import 'package:maqsafy/core/widgets/popups/popup_message.dart';
// import 'package:pay/pay.dart';
//
// typedef OnAppleSheetPaySuccessCallback = Function(
//     ResponseApplePayBottomSheet result);
//
// class ApplePaySharedButton extends StatefulWidget {
//   final double amount;
//   final String endpointSession;
//
//   ApplePaySystemApplicationType apiUtilType;
//   OnAppleSheetPaySuccessCallback onAppleSheetPaySuccessCallback;
//   final Function(String error)? onErrorCallback;
//
//   ApplePaySharedButton({
//     super.key,
//     required this.amount,
//     required this.endpointSession,
//     required this.onAppleSheetPaySuccessCallback,
//     required this.apiUtilType,
//     this.onErrorCallback,
//   });
//
//   @override
//   State<ApplePaySharedButton> createState() => ApplePaySharedButtonState();
// }
//
// class ApplePaySharedButtonState extends State<ApplePaySharedButton> {
//   ///--------------------------------------------------------------- variable
//
//   final String tag = 'ApplePaySharedButton';
//
//   /// false : means  Apple Pay not available on device'
//   bool isAvailable = false;
//   bool isLoading = false;
//   bool isProcessing = false;
//
//   /// core
//   ApplePayPluginHelper applePayService = ApplePayPluginHelper();
//
//   /// response
//   ApplePaySharedRepositoryImpl repositoryImp =
//       sl<ApplePaySharedRepositoryImpl>();
//   ResponseGenerateApplePaySession? responseSession;
//
//   ///---------------------------------------------------------------  build ui
//
//   @override
//   void initState() {
//     super.initState();
//     checkAvailabilityAndSetupPayPlugin();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Log.i(
//         '$tag - build() - isApplePayEnabled: ${FlavorConfig.isApplePayEnabled}, _isLoading: $isLoading, _isAvailable: $isAvailable, _isProcessing: $isProcessing');
//
//     // Don't show if Apple Pay is not configured
//     if (!FlavorConfig.isApplePayEnabled) {
//       Log.i('$tag - build() - Hiding: Apple Pay not enabled in FlavorConfig');
//       return const SizedBox.shrink();
//     }
//
//     // Show loading while checking availability
//     if (isLoading) {
//       return Container(
//         width: double.infinity,
//         height: 55.h,
//         child: Center(
//           child: SizedBox(
//             width: 24.h,
//             height: 24.h,
//             child: CircularProgressIndicator(strokeWidth: 2),
//           ),
//         ),
//       );
//     }
//
//     // Don't show if Apple Pay is not available on device
//     if (!isAvailable) {
//       Log.i('$tag - build() - Hiding: Apple Pay not available on device');
//       return const SizedBox.shrink();
//     }
//
//     // Show processing indicator
//     if (isProcessing) {
//       return Container(
//         width: double.infinity,
//         height: 55.h,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(10.r),
//         ),
//         child: Center(
//           child: SizedBox(
//             width: 24.h,
//             height: 24.h,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//             ),
//           ),
//         ),
//       );
//     }
//
//     // Show Apple Pay button
//     Log.i(
//         '$tag - build() - Showing Apple Pay button - amount: ${widget.amount} ');
//     return Container(
//       width: double.infinity,
//       height: 55.h,
//       child: RawApplePayButton(
//         style: ApplePayButtonStyle.black,
//         type: ApplePayButtonType.buy,
//         cornerRadius: 10.r,
//         onPressed: () async => await processPayment(),
//       ),
//     );
//   }
// }
