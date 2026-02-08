// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:flutter/services.dart';
// import 'package:maqsafy/core/env.dart';
// import 'package:maqsafy/core/errors/failure_handler.dart';
// import 'package:maqsafy/core/errors/failures.dart';
// import 'package:maqsafy/core/flavor_config.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/core/apple_pay_system_application_type.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/presenation/button/apple_pay_shared_button.dart';
// import 'package:maqsafy/core/utils/device/DeviceTools.dart';
// import 'package:maqsafy/core/utils/log/Log.dart' show Log, log;
// import 'package:maqsafy/core/utils/values/ToolsValidation.dart';
// import 'package:pay/pay.dart';
//
// class ApplePayPluginHelper {
//   ///--------------------------------------------------------------------- variable
//
//   Pay? _payClient;
//
//   ///--------------------------------------------------------------------- public methods
//
//   /// Check if Apple Pay is available on this device
//   /// Note: We don't check userCanPay because the Apple Pay sheet
//   /// allows users to add a new card if they don't have one configured
//   Future<bool> isAvailableAndSetupPayPlugin(
//       ApplePaySystemApplicationType apiUtilType) async {
//     log('Checking if Apple Pay is available',
//         name: 'ApplePayService.isAvailable');
//
//     /// is test
//     if (isTestShowApplePayButtonAndAcceptPaymentFakeObject) {
//       return true;
//     }
//
//     if (!Platform.isIOS) {
//       log('Apple Pay not available - not iOS platform',
//           name: 'ApplePayService.isAvailable');
//       return false;
//     }
//
//     if (!FlavorConfig.isApplePayEnabled) {
//       log('Apple Pay not available - disabled in flavor config',
//           name: 'ApplePayService.isAvailable');
//       return false;
//     }
//
//     // Verify we can create a Pay client (merchant ID is configured)
//     try {
//       await _getPayClient(apiUtilType);
//       log('Apple Pay is available', name: 'ApplePayService.isAvailable');
//       return true;
//     } catch (e) {
//       log('Apple Pay availability check failed: $e',
//           name: 'ApplePayService.isAvailable');
//       return false;
//     }
//   }
//
//   /// Show Apple Pay payment sheet
//   Future<Either<Failure, Map<String, dynamic>>>
//       showApplePaySheetReturnResultObject({
//     required double amount,
//     required String label,
//     required ApplePaySystemApplicationType apiUtilType,
//   }) async {
//     try {
//       /// is test android
//       if (isTestShowApplePayButtonAndAcceptPaymentFakeObject &&
//           DeviceTools.isAndroid()) {
//         return left(ServerMessageFailure(
//             message: "Android Device not supported at test environment"));
//       }
//
//       final payClient = await _getPayClient(apiUtilType);
//       Log.i('apple pay - showApplePaySheetReturnResultObject() start');
//
//       final paymentItems = [
//         PaymentItem(
//           label: label,
//           amount: amount.toStringAsFixed(2),
//           status: PaymentItemStatus.final_price,
//         ),
//       ];
//
//       final result = await payClient.showPaymentSelector(
//         PayProvider.apple_pay,
//         paymentItems,
//       );
//       Log.i(
//           'apple pay -  showApplePaySheetReturnResultObject() result: $result');
//
//       /// check is empty map
//       if (result.isEmpty) {
//         Log.i(
//             'apple pay - showApplePaySheetReturnResultObject() start Apple Pay returned empty result');
//         // throw Exception('Apple Pay returned empty result');
//         return left(
//             ServerMessageFailure(message: 'Apple Pay returned empty result'));
//       }
//
//       /// validate found token
//       bool isEmptyToken = result.containsKey("token") == false ||
//           ToolsValidation.isEmpty(result["token"]);
//       if (isEmptyToken) {
//         return left(
//             ServerMessageFailure(message: 'Apple Pay returned empty token'));
//       }
//       Log.i(
//           'apple pay -  showApplePaySheetReturnResultObject() start completed successfully ');
//       return right(result);
//     } on PlatformException catch (e) {
//       if (e.code == 'userCanceled' || e.code == 'paymentCanceled') {
//         log('Apple Pay sheet cancelled by user - Code: ${e.code}',
//             name: 'ApplePayService._showApplePaySheet');
//         // return  null ;
//       }
//       Log.i(
//           'apple pay - showApplePaySheetReturnResultObject() PlatformException in Apple Pay sheet - Code: ${e.code},'
//           ' Message: ${e.message} ApplePayService._showApplePaySheet');
//       // rethrow;
//       // throw Exception('Apple Pay returned empty result');
//       return left(ServerMessageFailure(message: e.message));
//     }
//   }
//
//   ///--------------------------------------------------------------------- private methods
//
//   Future<Pay> _getPayClient(ApplePaySystemApplicationType apiUtilType) async {
//     /// get merchant identifier
//     String? merchantIdentifier =
//         _getMerchantIdentifierByApiUtilType(apiUtilType);
//     if (merchantIdentifier == null) {
//       log('Apple Pay Merchant Identifier is not configured',
//           name: 'ApplePayService._getPayClient');
//       throw Exception('Apple Pay Merchant Identifier is not configured');
//     }
//     Log.i(
//         'apple pay - _getPayClient() - apiUtilType: $apiUtilType /merchantIdentifier: $merchantIdentifier');
//
//     /// setup config
//     final configJson = _buildApplePayConfig(
//       merchantIdentifier: merchantIdentifier,
//     );
//     final config = PaymentConfiguration.fromJsonString(configJson);
//     _payClient = Pay({
//       PayProvider.apple_pay: config,
//     });
//     return _payClient!;
//   }
//
//   /// Build Apple Pay configuration JSON
//   String _buildApplePayConfig({
//     required String merchantIdentifier,
//   }) {
//     List<String> supportedNetworks = _getSupportedNetworksForConfigure(1000);
//     log('Building Apple Pay configuration - Merchant: $merchantIdentifier, Networks: $supportedNetworks',
//         name: 'ApplePayService._buildApplePayConfig');
//
//     final config = {
//       'provider': 'apple_pay',
//       'data': {
//         'merchantIdentifier': merchantIdentifier,
//         'displayName': 'Maqsafy',
//         'merchantCapabilities': ['3DS', 'debit', 'credit'],
//         'supportedNetworks': supportedNetworks,
//         'countryCode': 'SA',
//         'currencyCode': 'SAR',
//       },
//     };
//
//     final configJson = jsonEncode(config);
//     log('Apple Pay configuration built successfully',
//         name: 'ApplePayService._buildApplePayConfig');
//     return configJson;
//   }
//
//   /// Get supported networks based on amount
//   /// If amount <= 300, only MADA is supported
//   /// If amount > 300, visa, mastercard, amex, and mada are supported
//   List<String> _getSupportedNetworksForConfigure(double amount) {
//     log('Getting supported networks for amount: $amount',
//         name: 'ApplePayService.getSupportedNetworks');
//
//     if (amount <= 300) {
//       log('Amount is <= 300, returning MADA only',
//           name: 'ApplePayService.getSupportedNetworks');
//       return ['mada'];
//     }
//     log('Amount is > 300, returning all networks',
//         name: 'ApplePayService.getSupportedNetworks');
//     return ['visa', 'masterCard', 'amex', 'mada'];
//   }
//
//   String? _getMerchantIdentifierByApiUtilType(
//       ApplePaySystemApplicationType apiUtilType) {
//     String? merchantIdentifier = null;
//     switch (apiUtilType) {
//       case ApplePaySystemApplicationType.maqsafy:
//         merchantIdentifier =
//             FlavorConfig.applePayMerchantIdentifierSystemMaqsafy;
//       case ApplePaySystemApplicationType.shop:
//         merchantIdentifier = FlavorConfig.applePayMerchantIdentifierSystemShop;
//     }
//     ;
//     return merchantIdentifier;
//   }
// }
