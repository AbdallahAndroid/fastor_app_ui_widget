// import 'package:dartz/dartz.dart';
// import 'package:maqsafy/core/errors/failure_handler.dart';
// import 'package:maqsafy/core/errors/failures.dart';
// import 'package:maqsafy/core/services/apple_pay/data/models/apple_pay_session_model.dart';
// import 'package:maqsafy/core/services/apple_pay/data/models/complete_order_request.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/data/apple_pay_shared_datasource.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/data/response/response_generate_apple_pay_session.dart';
//
// abstract interface class ApplePaySharedRepository {
//   /// Generate Apple Pay session from backend
//   Future<Either<Failure, ResponseGenerateApplePaySession>>
//       generateSessionApiUtilMaqsafy(
//           {required double amount, required String endpointSession});
//
//   Future<Either<Failure, ResponseGenerateApplePaySession>>
//       generateSessionUsingApiUtilShop(
//           {required double amount, required String endpointSession});
// }
//
// class ApplePaySharedRepositoryImpl implements ApplePaySharedRepository {
//   ApplePaySharedDataSourceImpl _dataSource;
//
//   ApplePaySharedRepositoryImpl(this._dataSource);
//
//   @override
//   Future<Either<Failure, ResponseGenerateApplePaySession>>
//       generateSessionApiUtilMaqsafy(
//           {required double amount, required String endpointSession}) async {
//     try {
//       final response = await _dataSource.generateSessionUsingApiUtilMaqsafy(
//           amount: amount, endpointSession: endpointSession);
//       return Right(response);
//     } catch (e) {
//       return Left(FailureHandler.chooseType(e));
//     }
//   }
//
//   @override
//   Future<Either<Failure, ResponseGenerateApplePaySession>>
//       generateSessionUsingApiUtilShop(
//           {required double amount, required String endpointSession}) async {
//     try {
//       final response = await _dataSource.generateSessionUsingApiUtilShop(
//           amount: amount, endpointSession: endpointSession);
//       return Right(response);
//     } catch (e) {
//       return Left(FailureHandler.chooseType(e));
//     }
//   }
// }
