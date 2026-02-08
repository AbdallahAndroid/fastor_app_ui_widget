// import 'package:dartz/dartz.dart';
// import 'package:maqsafy/core/env.dart' as env;
// import 'package:maqsafy/core/errors/failure_message.dart';
// import 'package:maqsafy/core/errors/failures.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/core/apple_pay_system_application_type.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/data/response/response_apple_pay_bottom_sheet.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/data/response/response_generate_apple_pay_session.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/presenation/button/apple_pay_shared_button.dart';
// import 'package:maqsafy/core/constants/localization/app_localization.dart';
// import 'package:maqsafy/core/flavor_config.dart';
// import 'package:maqsafy/core/utils/log/Log.dart';
// import 'package:maqsafy/core/widgets/popups/popup_message.dart';
// import 'package:pay/pay.dart';
//
// extension ApplePaySharedLogic on ApplePaySharedButtonState {
//   ///------------------------------------------------------------------ check  Availability
//
//   Future<void> checkAvailabilityAndSetupPayPlugin() async {
//     setState(() => isLoading = true);
//
//     final isAvailableResult =
//         await applePayService.isAvailableAndSetupPayPlugin(widget.apiUtilType);
//
//     if (mounted) {
//       setState(() {
//         isAvailable = isAvailableResult;
//         isLoading = false;
//       });
//       if (isAvailable == false) {
//         Log.i(
//             '$tag - _checkAvailability() -  _isAvailable: $isAvailable - stop !');
//       }
//     }
//   }
//
//   ///--------------------------------------------------------------- payment
//
//   Future<void> processPayment() async {
//     if (isProcessing) return;
//
//     if (widget.amount <= 0) {
//       PopupMessage.show(context, 'please_enter_valid_amount'.tr());
//       return;
//     }
//
//     setState(() => isProcessing = true);
//
//     // Step 1: Generate session from backend, choose type api utils
//     if (widget.apiUtilType == ApplePaySystemApplicationType.shop) {
//       final sessionResult = await repositoryImp.generateSessionUsingApiUtilShop(
//         amount: widget.amount,
//         endpointSession: widget.endpointSession,
//       );
//       await _handleResultFold(sessionResult);
//     } else {
//       final sessionResult = await repositoryImp.generateSessionApiUtilMaqsafy(
//         amount: widget.amount,
//         endpointSession: widget.endpointSession,
//       );
//       await _handleResultFold(sessionResult);
//     }
//   }
//
//   _handleResultFold(
//       Either<Failure, ResponseGenerateApplePaySession> sessionResult) async {
//     sessionResult.fold(
//       (failure) {
//         Log.e('ApplePayPaymentButton - Payment failed: $failure');
//         var msg = getFailureMessage(failure);
//         _firePaymentFailed(msg);
//       },
//       (ResponseGenerateApplePaySession response) async {
//         responseSession = response;
//         Log.i(
//             'ApplePayPaymentButton - success gatewayResponse: ${responseSession?.data?.gatewayResponse}');
//
//         /// step 2 : bottom sheet
//         await showApplePayBottomSheet();
//       },
//     );
//   }
//
//   Future showApplePayBottomSheet() async {
//     var fold = await applePayService.showApplePaySheetReturnResultObject(
//         amount: widget.amount,
//         label: FlavorConfig.localizedAppName,
//         apiUtilType: widget.apiUtilType);
//
//     fold.fold((failure) {
//       var msg = getFailureMessage(failure);
//       _firePaymentFailed(msg);
//     }, (responseAppPayBottomSheet) {
//       _firePaymentSuccess(responseAppPayBottomSheet);
//     });
//   }
//
//   void _firePaymentFailed(String msg) {
//     if (mounted) {
//       setState(() => isProcessing = false);
//     }
//     widget.onErrorCallback?.call(msg);
//   }
//
//   void _firePaymentSuccess(Map<String, dynamic> responseAppPayBottomSheet) {
//     ResponseApplePayBottomSheet response = ResponseApplePayBottomSheet();
//     response.fromJson(responseAppPayBottomSheet);
//
//     widget.onAppleSheetPaySuccessCallback(response);
//   }
// }
