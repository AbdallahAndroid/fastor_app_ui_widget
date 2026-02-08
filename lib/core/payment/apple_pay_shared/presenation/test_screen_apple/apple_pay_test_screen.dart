// import 'package:flutter/material.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/core/apple_pay_system_application_type.dart';
// import 'package:maqsafy/core/services/apple_pay_shared/presenation/button/apple_pay_shared_button.dart';
// import 'package:maqsafy/core/utils/api_utils/api_endpoints.dart';
// import 'package:maqsafy/core/utils/device/DeviceTools.dart';
// import 'package:maqsafy/core/utils/log/Log.dart';
// import 'package:maqsafy/core/widgets/text/app_text.dart';
//
// class ApplePayTestScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => ApplePayTestScreenState();
// }
//
// class ApplePayTestScreenState extends State<ApplePayTestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//               width: DeviceTools.getWidth(context),
//               height: DeviceTools.getHeight(context),
//               color: Colors.white60,
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: AppText(
//                       "Apple Pay Test Screen",
//                       fontSize: 25,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                   AppText(
//                     "Testing Apple Pay Store base url, for checkout",
//                     fontSize: 25,
//                   ),
//                   ApplePaySharedButton(
//                     amount: 1,
//                     apiUtilType: ApplePaySystemApplicationType.shop,
//                     endpointSession:
//                         ApiEndpoints.applePayStoreBaseUrlForGenerateSession,
//                     onAppleSheetPaySuccessCallback: (result) {
//                       Log.i(
//                           "ApplePaySharedButton - onPaymentResult() result : $result");
//                     },
//                     onErrorCallback: (e) {
//                       Log.i("ApplePaySharedButton - onError() e : $e");
//                     },
//                   )
//                 ],
//               ))),
//     );
//   }
// }
