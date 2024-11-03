

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/textfield_error/ErrorInputFieldModel.dart';

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


  static Map<String, dynamic> generateErrorArrayMessageShapeLaravelWithOneMessage( String key, String errorMessage ){
    List<ErrorInputFieldEntity> arrayErrorModel = [];
    arrayErrorModel.add( ErrorInputFieldEntity(key:  key , value: errorMessage )) ;
    return generateErrorArrayMessageShapeLaravelTakeArray(arrayErrorModel);
  }


  static Map<String, dynamic> generateErrorArrayMessageShapeLaravelTakeArray(List<ErrorInputFieldEntity> arrayErrorModel ){
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