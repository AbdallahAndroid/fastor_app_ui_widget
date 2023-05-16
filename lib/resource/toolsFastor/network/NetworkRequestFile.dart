// import 'package:image_picker/image_picker.dart';

import 'package:cross_file/cross_file.dart';

class NetworkRequestFile  {

  //--------------------------------------------------------------- variable

  String  parameterFile = "file";

  /***
  ///////////choose type of request
  1-
   */
  String? filePath;
  XFile? xFile;



  /**
   Why make this way of carry parameter body ?
      Due to "Dio" webservice not allow to send dyamic parameter in post body

      var formData = FormData.fromMap();

   */
  //body request
  String? body_key1 ;
  String? body_value1;
  String? body_key2;
  String? body_value2;
  String? body_key3;
  String? body_value3;
  String? body_key4;
  String? body_value4;
  String? body_key5;
  String? body_value5;
  String? body_key6;
  String? body_value6;
  String? body_key7;
  String? body_value7;

  String body_keyMoreThan7 = "extraBodyValue";
  String body_valueMoreThan7 = "";

   @override
  String toString() {
    return 'NetworkRequestFile{filePath: $filePath, body_key1: $body_key1, body_value1: $body_value1, body_key2: $body_key2, body_value2: $body_value2, body_key3: $body_key3, body_value3: $body_value3, body_key4: $body_key4, body_value4: $body_value4, body_key5: $body_key5, body_value5: $body_value5, body_key6: $body_key6, body_value6: $body_value6, body_key7: $body_key7, body_value7: $body_value7}';
  }

  //-------------------------------------------------------------- factory


  NetworkRequestFile.fromFilePath(String filePath) {
    this.filePath = filePath;
  }

  NetworkRequestFile.fromXFileAndBody(XFile xFile, Map<String, String>? body) {

    this.xFile = xFile;

    if( body == null ) return  ;

    int index = 1;
    body.forEach((k,v) {
      setByIndex(this, index, k, v);
      index = index + 1;
    });

  }

  NetworkRequestFile.fromFilePathAndBody(String filePath, Map<String, String>? body) {
    if( body == null ) {
       NetworkRequestFile.fromFilePath( filePath);
       return ;
    }


    this.filePath = filePath;

    int index = 1;
    body.forEach((k,v) {
      setByIndex(this, index, k, v);
      index = index + 1;
    });
  }


   void setByIndex(NetworkRequestFile obj, int index, String k, String v) {
    switch( index ) {
      case 1 : { obj.body_key1 = k; obj.body_value1 = v; } break;
      case 2 : { obj.body_key2 = k; obj.body_value2 = v; } break;
      case 3 : { obj.body_key3 = k; obj.body_value3 = v; } break;
      case 4 : { obj.body_key4 = k; obj.body_value4 = v; } break;
      case 5 : { obj.body_key5 = k; obj.body_value5 = v; } break;
      case 6 : { obj.body_key6 = k; obj.body_value6 = v; } break;
      case 7 : { obj.body_key7 = k; obj.body_value7 = v; } break;
      default: {
        obj.body_valueMoreThan7 += v + " ,";
      }
    }
  }

}