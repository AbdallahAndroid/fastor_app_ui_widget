// import 'dart:convert';
//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:maqsafy/core/app_injections/app_injections.dart';
// import 'package:maqsafy/core/constants/localization/app_localization.dart';
// import 'package:maqsafy/core/errors/exception_handler.dart';
// import 'package:maqsafy/core/errors/exceptions.dart';
// import 'package:maqsafy/core/errors/failures.dart';
// import 'package:maqsafy/core/flavor_config.dart';
// import 'package:maqsafy/core/network/ValidateResponse.dart';
// import 'package:maqsafy/core/services/apple_pay/data/models/apple_pay_session_model.dart';
// import 'package:maqsafy/core/services/apple_pay/data/models/complete_order_request.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/data/response/response_generate_apple_pay_session.dart'
//     show ResponseGenerateApplePaySession;
// import 'package:maqsafy/core/utils/api_utils/api_endpoints.dart';
// import 'package:maqsafy/core/utils/api_utils/api_util.dart';
// import 'package:maqsafy/core/utils/api_utils/shop_api_util.dart';
// import 'package:maqsafy/core/utils/log/Log.dart' show Log, log;
// import 'package:maqsafy/core/utils/values/ToolsValidation.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//
// abstract class ApplePaySharedDataSourceBase {
//   Future<ResponseGenerateApplePaySession> generateSessionUsingApiUtilMaqsafy(
//       {required double amount, required String endpointSession});
//
//   Future<ResponseGenerateApplePaySession> generateSessionUsingApiUtilShop(
//       {required double amount, required String endpointSession});
// }
//
// class ApplePaySharedDataSourceImpl implements ApplePaySharedDataSourceBase {
//   ApiUtil apiUtil;
//   ShopApiUtil shopApiUtil;
//
//   ApplePaySharedDataSourceImpl(this.apiUtil, this.shopApiUtil);
//
//   @override
//   Future<ResponseGenerateApplePaySession> generateSessionUsingApiUtilMaqsafy(
//       {required double amount, required String endpointSession}) async {
//     log('Sending POST request to generate session',
//         name: 'ApplePayDataSourceImpl.generateSession');
//     // ApiUtil apiUtil = sl<ApiUtil>();
//     final response = await apiUtil.post(
//       endpoint: endpointSession, //ApiEndpoints.applePaySessionUrl,
//       isEnableLogDioPretty: true,
//       // body: {
//       //   'amount': amount.toString(),
//       // },
//     );
//
//     // Check if response is successful (200) and contains expected Apple Pay session data
//     if (ValidateResponse.isStatusFrom200To210Response(response)) {
//       return ResponseGenerateApplePaySession.fromJson(response.data);
//     }
//
//     // If not a successful Apple Pay session, use exception handler
//     Log.i('generateSession() - failed');
//     throw ExceptionHandler.chooseThrowExceptionDio(response);
//   }
//
//   @override
//   Future<ResponseGenerateApplePaySession> generateSessionUsingApiUtilShop(
//       {required double amount, required String endpointSession}) async {
//     log('Sending POST request to generate session',
//         name: 'ApplePayDataSourceImpl.generateSession');
//     // ApiUtil apiUtil = sl<ApiUtil>();
//     final response = await shopApiUtil.post(
//       endpoint: endpointSession,
//     );
//
//     // Check if response is successful (200) and contains expected Apple Pay session data
//     if (ValidateResponse.isStatusFrom200To210Response(response)) {
//       return ResponseGenerateApplePaySession.fromJson(response.data);
//     }
//
//     // If not a successful Apple Pay session, use exception handler
//     Log.i('generateSession() - failed');
//     throw ExceptionHandler.chooseThrowExceptionDio(response);
//   }
// }
