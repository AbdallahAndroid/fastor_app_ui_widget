// import 'dart:convert';
//
// import 'package:maqsafy/core/utils/log/Log.dart';
//
// class ResponseApplePayBottomSheet {
//   Map<String, dynamic> data = Map();
//
//   /**
//       -------------------------- plugin "pay" in flutter
//
//       {
//       "paymentMethod": {
//       "network": "MasterCard",
//       "displayName": "MasterCard 0909",
//       "type": 2
//       },
//       "token": {
//       "data": "w2x3٫****************************AAA",
//       "signature": "MIA***************",
//       "header": {
//       "publicKeyHash": "*************************x0=",
//       "ephemeralPublicKey": "MFkw****************=",
//       "transactionId": "9c004*******************"
//       },
//       "version": "EC_v1"
//       },
//       "transactionIdentifier": "********************"
//
//
//    */
//   void fromJson(Map<String, dynamic> responseAppPayBottomSheet) {
//     this.data = responseAppPayBottomSheet;
//   }
//
//   /** -------------------------- the backend maqsafy need this shape
//       {
//       "paymentData": {
//       "version": "EC_v1",
//       "data": "xZv+rXzPdLX2j8i9S8nP3qz2YN8KjO...", // Encrypted payment data (Base64 encoded)
//       "signature": "MIAGCSqGSIb3DQEHA...", // Payment data signature (Base64 encoded)
//
//       "header": {
//       "ephemeralPublicKey": "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE...", // Ephemeral public key (Base64 encoded)
//       "publicKeyHash": "KRsyW0NauLpN8OwKr+...", // Hash of merchant public key (Base64 encoded)
//       "transactionId": "fd88874954acdb299c285f95a3202ad1f330d3fd"
//       }
//       },
//       "paymentMethod": {
//       "displayName": "Mastercard 8886",
//       "network": "Mastercard",
//       "type": "credit"
//       },
//       "transactionIdentifier": "FD88874954ACDB299C285F95A3202AD1F330D3FD"
//       }
//    */
//   /**
//    * ------------------ erorr from maqsafy
//
//       "apple_pay_token.paymentData.data": [
//       flutter: ║                     The apple pay token.payment data.data field is required when Payment Method is apple_pay.
//       flutter: ║             ],
//       flutter: ║             "apple_pay_token.paymentData.signature": [
//       flutter: ║                     The apple pay token.payment data.signature field is required when Payment Method is apple_pay.
//       flutter: ║             ],
//       flutter: ║             "apple_pay_token.paymentData.header": [
//       flutter: ║                     The apple pay token.payment data.header field is required when Payment Method is apple_pay.
//       flutter: ║             ],
//       flutter: ║             "apple_pay_token.paymentData.version": [
//       flutter: ║                     The apple pay token.payment data.version field is required when Payment Method is apple_pay.
//       flutter: ║             ]
//
//    */
//   Map<String, dynamic> toJson() {
//     try {
//       final transactionIdentifier = data["transactionIdentifier"];
//       final tokenRaw = data["token"];
//
//       // Handle both String (JSON) and Map types for token
//       Map<String, dynamic>? token;
//
//       if (tokenRaw == null) {
//         throw Exception("Apple Pay token is null");
//       } else if (tokenRaw is String) {
//         // Token is a JSON string, parse it
//         try {
//           token = jsonDecode(tokenRaw) as Map<String, dynamic>;
//         } catch (e) {
//           Log.i("ResponseApplePayBottomSheet - Failed to parse token JSON: $e");
//           throw Exception("Failed to parse Apple Pay token JSON: $e");
//         }
//       } else if (tokenRaw is Map<String, dynamic>) {
//         // Token is already a Map
//         token = tokenRaw;
//       } else {
//         throw Exception("Unexpected token type: ${tokenRaw.runtimeType}");
//       }
//
//       final tokenData = token["data"];
//       final tokenSignature = token["signature"];
//       final tokenVersion = token["version"];
//       final header = token["header"] as Map<String, dynamic>?;
//       final paymentMethod = data["paymentMethod"] as Map<String, dynamic>?;
//
//       // Validate required fields
//       if (tokenData == null) {
//         throw Exception("Apple Pay token.data is null");
//       }
//       if (tokenSignature == null) {
//         throw Exception("Apple Pay token.signature is null");
//       }
//       if (tokenVersion == null) {
//         throw Exception("Apple Pay token.version is null");
//       }
//       if (header == null) {
//         throw Exception("Apple Pay token.header is null");
//       }
//
//       return {
//         "paymentMethod": paymentMethod ?? data["paymentMethod"],
//         "transactionIdentifier": transactionIdentifier,
//         "paymentData": {
//           "data": tokenData,
//           "signature": tokenSignature,
//           "version": tokenVersion,
//           "header": {
//             "publicKeyHash": header["publicKeyHash"],
//             "ephemeralPublicKey": header["ephemeralPublicKey"],
//             "transactionId": header["transactionId"],
//           },
//         },
//       };
//     } catch (e, stackTrace) {
//       Log.i("ResponseApplePayBottomSheet - toJson() - EXCEPTION: $e");
//       Log.i(
//           "ResponseApplePayBottomSheet - toJson() - STACK TRACE: $stackTrace");
//       rethrow;
//     }
//   }
// }
//
// /// nested to "token" object from flutter plugin
// // "header": data["token"]["header"],
// // "signature": data["token"]["signature"],
// // "data": data["token"]["data"],
// // "version": data["token"]["version"]
