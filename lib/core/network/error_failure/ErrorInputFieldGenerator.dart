import 'package:fastor_app_ui_widget/core/log/Log.dart';

class ErrorModel {

  String key;
  String value;

  ErrorModel({
      required this.key,
    required this.value
  });
}



///
/// example error:
/// {
//     "status": false,
//     "message": "أنواع التقطيع مطلوب.",
//     "errors": {
//         "products.0.chopping_id": [
//             "أنواع التقطيع مطلوب."
//         ],
//         "products.0.packaging_id": [
//             "أنواع التغليف مطلوب."
//         ]
//     }
// }
///
///
///
class ErrorInputFieldGenerator {


  static Map<String, dynamic> generateErrorArrayMessageShapeLaravel(List<ErrorModel> arrayErrorModel ){
    Map<String, dynamic> errors = Map();

    arrayErrorModel.forEach(( model ) {
      List<String> valuesInArrayShape = [];
      valuesInArrayShape.add( model.value );
      errors["${model.key}"] = valuesInArrayShape;
    });

    Map<String, dynamic> data = Map();
    data["errors"] = errors;
    Log.i("ErrorInputFieldGenerator - generateErrorArrayMessage() - data: $data");
    return errors;
  }
}